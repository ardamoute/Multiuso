/*

Copyright © 2009-2010 Quentin RICHERT

Multiuso is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

Multiuso is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with Multiuso.  If not, see <http://www.gnu.org/licenses/>.

*/

#ifndef HEADER_MESSAGERIE
#define HEADER_MESSAGERIE

#include <QtNetwork>
#include "../CurrentIncludes.h"
#include "autresClasses/PasswordDialog.h"

class SuscribeLabel : public QLabel
{
	Q_OBJECT

	public:
		SuscribeLabel() : QLabel("<center>Créer un compte</center>")
		{
			setStyleSheet("color:orange;");
			setCursor(Qt::ArrowCursor);
		}

	protected:
		void mousePressEvent(QMouseEvent *)
		{
			emit clicked();
		}

		void enterEvent(QEvent *)
		{
			setStyleSheet("color:red;");
			setCursor(Qt::PointingHandCursor);
		}

		void leaveEvent(QEvent *)
		{
			setStyleSheet("color:orange;");
			setCursor(Qt::ArrowCursor);
		}

	signals:
		void clicked();
};

class ConnectionWidget : public QWidget
{
	Q_OBJECT

	public:
		ConnectionWidget()
		{
			m_pseudo = new QLineEdit;

			m_password = new QLineEdit;
				m_password->setEchoMode(QLineEdit::Password);
			
			QFormLayout *layoutConnection = new QFormLayout;
				layoutConnection->addRow("Utilisateur :", m_pseudo);
				layoutConnection->addRow("Mot de passe :", m_password);

			QGroupBox *groupConnection = new QGroupBox("Connexion");
				groupConnection->setLayout(layoutConnection);

			m_rememberMe = new QCheckBox;

			m_rememberMyPassword = new QCheckBox;
	
			QFormLayout *layoutInfos = new QFormLayout;
				layoutInfos->addRow("Se souvenir de moi : ", m_rememberMe);
				layoutInfos->addRow("Se souvenir du mot de passe : ", m_rememberMyPassword);

			SuscribeLabel *labelSuscribe = new SuscribeLabel;
				connect(labelSuscribe, SIGNAL(clicked()), this, SLOT(suscribe()));

			QPushButton *buttonConnect = new QPushButton("Se connecter");
			
			QVBoxLayout *mainLayout = new QVBoxLayout(this);
				mainLayout->addWidget(groupConnection);
				mainLayout->addLayout(layoutInfos);
				mainLayout->addWidget(labelSuscribe);
				mainLayout->addWidget(buttonConnect);
				mainLayout->setAlignment(Qt::AlignCenter);


			setInfos();
		}

		void setInfos()
		{
			QSettings settings(Multiuso::appDirPath() + "/ini/messagerie.ini");
				m_pseudo->setText(settings.value("pseudo").toString());
				m_password->setText(settings.value("password").toString());

				if (settings.value("remember_me").toBool())
					m_rememberMe->setCheckState(Qt::Checked);

				if (settings.value("remember_my_password").toBool())
					m_rememberMyPassword->setCheckState(Qt::Checked);
		}

		void saveInfos()
		{
			QString pseudo = m_pseudo->text();

			if (!m_rememberMe->isChecked())
				pseudo = "";

			QString password = m_password->text();
			
			if (!m_rememberMyPassword->isChecked())
				password = "";

			QSettings settings(Multiuso::appDirPath() + "/ini/messagerie.ini");
				settings.setValue("pseudo", pseudo);
				settings.setValue("password", password);
				settings.setValue("remember_me", m_rememberMe->isChecked());
				settings.setValue("remember_my_password", m_rememberMyPassword->isChecked());
		}

		QString pseudo()
		{
			return m_pseudo->text();
		}

		QString password()
		{
			return m_password->text();
		}

	public slots:
		void suscribe()
		{
			QDialog *infosDialog = new QDialog(this);
				
				QLineEdit *linePseudo = new QLineEdit;
				QLineEdit *lineFirstName = new QLineEdit;
				QLineEdit *lineLastName = new QLineEdit;

				QFormLayout *layoutLines = new QFormLayout;
					layoutLines->addRow("Pseudo (25 carac. max.) :", linePseudo);
					layoutLines->addRow("Prénom :", lineFirstName);
					layoutLines->addRow("Nom :", lineLastName);

				QPushButton *buttonReject = new QPushButton("Annuler");
					connect(buttonReject, SIGNAL(clicked()), infosDialog, SLOT(reject()));

				QHBoxLayout *buttonsLayout = new QHBoxLayout;
					buttonsLayout->addWidget(buttonReject);
					buttonsLayout->addWidget(Multiuso::closeButton(infosDialog, "OK"));
					buttonsLayout->setAlignment(Qt::AlignRight);

				QVBoxLayout *layoutDialog = new QVBoxLayout(infosDialog);
					layoutDialog->addWidget(new QLabel("Ces informations serviront à vos contacts pour identifier "
								"vos messages<br />et ne seront en aucun divulguées à votre insu."));
					layoutDialog->addLayout(layoutLines);
					layoutDialog->addLayout(buttonsLayout);

			if (infosDialog->exec() == QDialog::Rejected)
			{
				return;
			}

			else if (linePseudo->text().isEmpty()
					|| linePseudo->text().length() > 25
					|| lineFirstName->text().isEmpty()
					|| lineLastName->text().isEmpty())
			{
				QMessageBox::critical(this, "Multiuso", "Vous devez remplir correctement tous les champs !");

				return;
			}

			PasswordDialog *pwdDialog = new PasswordDialog(this);

			if (pwdDialog->exec() == QDialog::Rejected)
				return;
			
			QString password = pwdDialog->getPassword();

			pwdDialog->deleteLater();

			suscribe(linePseudo->text(), password, lineFirstName->text(), lineLastName->text());
		}

		void suscribe(QString pseudo, QString pwd, QString firstName, QString lastName)
		{
			QNetworkRequest request(QCoreApplication::organizationDomain() + "messages.php?request=suscribe"
												"&pseudo=" + pseudo +
												"&pwd=" + pwd +
												"&first_name=" + firstName +
												"&last_name=" + lastName);

			QNetworkAccessManager *manager = new QNetworkAccessManager(this);

			suscribeReply = manager->get(request);
				connect(suscribeReply, SIGNAL(finished()), this, SLOT(getSuscribeReply()));
				connect(suscribeReply, SIGNAL(error(QNetworkReply::NetworkError)), this, SLOT(getSuscribeReply(QNetworkReply::NetworkError)));
		}

		void getSuscribeReply()
		{
			QFile reply(Multiuso::tempPath() + "/reply");
				reply.open(QIODevice::WriteOnly | QIODevice::Text);
					reply.write(suscribeReply->readAll());
				reply.close();

			suscribeReply->deleteLater();

			QTextStream stream(&reply);

			reply.open(QIODevice::ReadOnly | QIODevice::Text);

				while (!stream.atEnd())
				{
					QString line = stream.readLine();

					if (line.startsWith("ERROR:"))
					{
						int error = line.replace(QRegExp("ERROR:([0-9]+)"), "\\1").toInt();

						switch (error)
						{
							case 0: QMessageBox::information(this, "Multiuso", "Inscription réussie !<br />Vous pouvez maintenant vous connecter !"); break;
							case 2: QMessageBox::critical(this, "Multiuso", "Ce pseudo est déjà utilisé !"); break;
							default: QMessageBox::critical(this, "Multiuso", "Erreur iconnue !"); break;
						}
					}
				}

			reply.close();
			reply.remove();
		}

		void getSuscribeReply(QNetworkReply::NetworkError)
		{
			QMessageBox::critical(this, "Multiuso", "Impossible d'accéder à la page d'inscription, réessayez plus tard.");
		}

	private:
		QLineEdit *m_pseudo;
		QLineEdit *m_password;

		QCheckBox *m_rememberMe;
		QCheckBox *m_rememberMyPassword;

		QNetworkReply *suscribeReply;
};

class Messagerie : public QDialog
{
	Q_OBJECT

	public:
		Messagerie(QWidget *parent);

	private:
		ConnectionWidget *connectionWidget;

		QStackedWidget *mainWidget;
};

#endif
