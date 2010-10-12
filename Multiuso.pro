######################################################################
# Automatically generated by qmake (2.01a) mar. oct. 12 22:59:45 2010
######################################################################

TEMPLATE = app
QT += network webkit
CONFIG += release
TARGET = Multiuso
win32:RC_FILE += ressources/windows.rc
DEPENDPATH += . \
              autresClasses \
              classesHighlighters \
              classesMenuAide \
              classesMenuAutresFonctionnalites \
              classesMenuEdition \
              classesPlugins \
              classesPrincipales \
              quazip \
              ressources \
              classesMenuAutresFonctionnalites/FeedTarsiers
INCLUDEPATH += . \
               quazip \
               classesPrincipales \
               autresClasses \
               classesHighlighters \
               classesPlugins \
               classesMenuAide \
               classesMenuAutresFonctionnalites \
               classesMenuEdition \
               classesMenuAutresFonctionnalites/FeedTarsiers

# Input
HEADERS += CurrentIncludes.h \
           Multiuso.h \
           autresClasses/Agenda.h \
           autresClasses/Astuces.h \
           autresClasses/Calculatrice.h \
           autresClasses/Calendrier.h \
           autresClasses/Chronometre.h \
           autresClasses/CodeClasseCppGenere.h \
           autresClasses/CodeEdit.h \
           autresClasses/CodePageWebGenere.h \
           autresClasses/ConfigurerFavoris.h \
           autresClasses/Cookies.h \
           autresClasses/CopyCut.h \
           autresClasses/EasterEggMatrix.h \
           autresClasses/EditerStyle.h \
           autresClasses/LineEdit.h \
           autresClasses/LoginDialog.h \
           autresClasses/MdiSubWindow.h \
           autresClasses/PasswordDialog.h \
           autresClasses/SpeedDial.h \
           autresClasses/SplashScreen.h \
           autresClasses/SuscribeDialog.h \
           autresClasses/TextEdit.h \
           autresClasses/VueDossier.h \
           autresClasses/WebPageScreenshot.h \
           classesHighlighters/HighlighterActionScript.h \
           classesHighlighters/HighlighterASM.h \
           classesHighlighters/HighlighterAutoIT.h \
           classesHighlighters/HighlighterBefunge.h \
           classesHighlighters/HighlighterBF.h \
           classesHighlighters/HighlighterC.h \
           classesHighlighters/HighlighterCaml.h \
           classesHighlighters/HighlighterCPP.h \
           classesHighlighters/HighlighterCSharp.h \
           classesHighlighters/HighlighterCSS.h \
           classesHighlighters/HighlighterD.h \
           classesHighlighters/HighlighterErlang.h \
           classesHighlighters/HighlighterFortran.h \
           classesHighlighters/HighlighterFSharp.h \
           classesHighlighters/HighlighterGLSL.h \
           classesHighlighters/HighlighterHaskell.h \
           classesHighlighters/HighlighterHTML.h \
           classesHighlighters/HighlighterINI.h \
           classesHighlighters/HighlighterIntercal.h \
           classesHighlighters/HighlighterIo.h \
           classesHighlighters/HighlighterJava.h \
           classesHighlighters/HighlighterJavaScript.h \
           classesHighlighters/HighlighterLexYacc.h \
           classesHighlighters/HighlighterLisp.h \
           classesHighlighters/HighlighterLua.h \
           classesHighlighters/HighlighterMiranda.h \
           classesHighlighters/HighlighterPascal.h \
           classesHighlighters/HighlighterPerl.h \
           classesHighlighters/HighlighterPHP.h \
           classesHighlighters/HighlighterPython.h \
           classesHighlighters/HighlighterRuby.h \
           classesHighlighters/HighlighterSQL.h \
           classesMenuAide/APropos.h \
           classesMenuAutresFonctionnalites/BlocNotes.h \
           classesMenuAutresFonctionnalites/CompresseurDeCode.h \
           classesMenuAutresFonctionnalites/CompteurDeLignes.h \
           classesMenuAutresFonctionnalites/CreerFichier.h \
           classesMenuAutresFonctionnalites/CreerReadme.h \
           classesMenuAutresFonctionnalites/GenerateurClassesCpp.h \
           classesMenuAutresFonctionnalites/GenerateurPageWeb.h \
           classesMenuAutresFonctionnalites/Messagerie.h \
           classesMenuAutresFonctionnalites/Organisateur.h \
           classesMenuAutresFonctionnalites/PlusOuMoins.h \
           classesMenuEdition/Preferences.h \
           classesPlugins/BaseAction.h \
           classesPlugins/BaseDockWidget.h \
           classesPlugins/BaseOnglet.h \
           classesPlugins/BaseWidget.h \
           classesPrincipales/Accueil.h \
           classesPrincipales/EditeurDeCode.h \
           classesPrincipales/EditeurDeTexte.h \
           classesPrincipales/FenPrincipale.h \
           classesPrincipales/Ftp.h \
           classesPrincipales/NavFichiers.h \
           classesPrincipales/NavigateurWeb.h \
           classesPrincipales/TelechargerFichier.h \
           classesPrincipales/VisionneurImages.h \
           classesPrincipales/Widgets.h \
           quazip/crc32.h \
           quazip/crypt.h \
           quazip/deflate.h \
           quazip/gzguts.h \
           quazip/inffast.h \
           quazip/inffixed.h \
           quazip/inflate.h \
           quazip/inftrees.h \
           quazip/ioapi.h \
           quazip/JlCompress.h \
           quazip/quaadler32.h \
           quazip/quachecksum32.h \
           quazip/quacrc32.h \
           quazip/quazip.h \
           quazip/quazipfile.h \
           quazip/quazipfileinfo.h \
           quazip/quazipnewinfo.h \
           quazip/trees.h \
           quazip/unzip.h \
           quazip/zconf.h \
           quazip/zip.h \
           quazip/zlib.h \
           quazip/zutil.h \
           classesMenuAutresFonctionnalites/FeedTarsiers/FeedTarsiers.h \
           classesMenuAutresFonctionnalites/FeedTarsiers/FeedTarsiersScene.h \
           classesMenuAutresFonctionnalites/FeedTarsiers/Tarsier.h
SOURCES += main.cpp \
           autresClasses/Agenda.cpp \
           autresClasses/Astuces.cpp \
           autresClasses/Calculatrice.cpp \
           autresClasses/Calendrier.cpp \
           autresClasses/Chronometre.cpp \
           autresClasses/CodeClasseCppGenere.cpp \
           autresClasses/CodeEdit.cpp \
           autresClasses/CodePageWebGenere.cpp \
           autresClasses/ConfigurerFavoris.cpp \
           autresClasses/Cookies.cpp \
           autresClasses/EditerStyle.cpp \
           autresClasses/SpeedDial.cpp \
           autresClasses/SplashScreen.cpp \
           autresClasses/TextEdit.cpp \
           autresClasses/VueDossier.cpp \
           autresClasses/WebPageScreenshot.cpp \
           classesHighlighters/HighlighterActionScript.cpp \
           classesHighlighters/HighlighterASM.cpp \
           classesHighlighters/HighlighterAutoIT.cpp \
           classesHighlighters/HighlighterBefunge.cpp \
           classesHighlighters/HighlighterBF.cpp \
           classesHighlighters/HighlighterC.cpp \
           classesHighlighters/HighlighterCaml.cpp \
           classesHighlighters/HighlighterCPP.cpp \
           classesHighlighters/HighlighterCSharp.cpp \
           classesHighlighters/HighlighterCSS.cpp \
           classesHighlighters/HighlighterD.cpp \
           classesHighlighters/HighlighterErlang.cpp \
           classesHighlighters/HighlighterFortran.cpp \
           classesHighlighters/HighlighterFSharp.cpp \
           classesHighlighters/HighlighterGLSL.cpp \
           classesHighlighters/HighlighterHaskell.cpp \
           classesHighlighters/HighlighterHTML.cpp \
           classesHighlighters/HighlighterINI.cpp \
           classesHighlighters/HighlighterIntercal.cpp \
           classesHighlighters/HighlighterIo.cpp \
           classesHighlighters/HighlighterJava.cpp \
           classesHighlighters/HighlighterJavaScript.cpp \
           classesHighlighters/HighlighterLexYacc.cpp \
           classesHighlighters/HighlighterLisp.cpp \
           classesHighlighters/HighlighterLua.cpp \
           classesHighlighters/HighlighterMiranda.cpp \
           classesHighlighters/HighlighterPascal.cpp \
           classesHighlighters/HighlighterPerl.cpp \
           classesHighlighters/HighlighterPHP.cpp \
           classesHighlighters/HighlighterPython.cpp \
           classesHighlighters/HighlighterRuby.cpp \
           classesHighlighters/HighlighterSQL.cpp \
           classesMenuAide/APropos.cpp \
           classesMenuAutresFonctionnalites/BlocNotes.cpp \
           classesMenuAutresFonctionnalites/CompresseurDeCode.cpp \
           classesMenuAutresFonctionnalites/CompteurDeLignes.cpp \
           classesMenuAutresFonctionnalites/CreerFichier.cpp \
           classesMenuAutresFonctionnalites/CreerReadme.cpp \
           classesMenuAutresFonctionnalites/GenerateurClassesCpp.cpp \
           classesMenuAutresFonctionnalites/GenerateurPageWeb.cpp \
           classesMenuAutresFonctionnalites/Messagerie.cpp \
           classesMenuAutresFonctionnalites/Organisateur.cpp \
           classesMenuAutresFonctionnalites/PlusOuMoins.cpp \
           classesMenuEdition/Preferences.cpp \
           classesPrincipales/Accueil.cpp \
           classesPrincipales/EditeurDeCode.cpp \
           classesPrincipales/EditeurDeTexte.cpp \
           classesPrincipales/FenPrincipale.cpp \
           classesPrincipales/Ftp.cpp \
           classesPrincipales/NavFichiers.cpp \
           classesPrincipales/NavigateurWeb.cpp \
           classesPrincipales/TelechargerFichier.cpp \
           classesPrincipales/VisionneurImages.cpp \
           classesPrincipales/Widgets.cpp \
           quazip/adler32.c \
           quazip/compress.c \
           quazip/crc32.c \
           quazip/deflate.c \
           quazip/gzclose.c \
           quazip/gzlib.c \
           quazip/gzread.c \
           quazip/gzwrite.c \
           quazip/infback.c \
           quazip/inffast.c \
           quazip/inflate.c \
           quazip/inftrees.c \
           quazip/ioapi.c \
           quazip/JlCompress.cpp \
           quazip/quaadler32.cpp \
           quazip/quacrc32.cpp \
           quazip/quazip.cpp \
           quazip/quazipfile.cpp \
           quazip/quazipnewinfo.cpp \
           quazip/trees.c \
           quazip/uncompr.c \
           quazip/unzip.c \
           quazip/zip.c \
           quazip/zutil.c \
           classesMenuAutresFonctionnalites/FeedTarsiers/FeedTarsiers.cpp \
           classesMenuAutresFonctionnalites/FeedTarsiers/FeedTarsiersScene.cpp \
           classesMenuAutresFonctionnalites/FeedTarsiers/Tarsier.cpp
RESOURCES += ressources/astuces.qrc \
             ressources/default_files.qrc \
             ressources/icones.qrc \
             ressources/images.qrc \
             ressources/splash_screen.qrc
