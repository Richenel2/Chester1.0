import QtQuick 2.15
import QtQuick.Controls 2.15

Item {
    Rectangle {
        id: containPages
        color: "#2c313c"
        anchors.fill: parent

        Rectangle {
            id: rectangle
            color: "#212222"
            radius: 20
            border.width: 0
            anchors.fill: parent
            anchors.rightMargin: 20
            anchors.leftMargin: 20
            anchors.bottomMargin: 20
            anchors.topMargin: 20

            Label {
                id: label
                height: 30
                color: "#55aaff"
                text: qsTr("Aide :")
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.bold: true
                font.pointSize: 15
                font.family: "Montserrat"
                anchors.rightMargin: 0
                anchors.leftMargin: 0
                anchors.topMargin: 10
            }

            ScrollView {
                id: scrollView
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: label.bottom
                anchors.bottom: parent.bottom
                clip: true
                anchors.topMargin: 10
                contentWidth: label.width

                Text {
                    id: text1
                    color: "#7bffffff"
                    text: '
<!DOCTYPE html>
<html lang="fr">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<style>
*{
font-family: Montserrat;
}
a{
color: #55aaff;
text-decoration: none;

}
h1{
color: #ff007f;
}
ol li{
color: #55aaff;
}
nav{
position: fixed;
right: 0px;
top: 0px;
margin: 10px;
width: 150px;
}
</style>
</head>
<body>
<nav>
<b><span style="color: #ff007f;">Menu</span></b>
<ul>
<a href="#apropos"><li>A propos</li></a>
<a href="#fonctionalite">
<li>Fonctionalit??s </li>
</a>
</ul>
</nav>
<h1 id="apropos"> A propos:</h1>
<p>
<span style="color: white;"> Chester </span> est un logiciel d??velopp?? par <span style="color: #55aaff;"> KayraDev</span>,
??tudiant en deuxi??me ann??e ?? <b>L\'Ecole Sup??rieure Internationale de G??nie Num??rique </b> dans le cardre d\'un concours de projets innovateurs
organiser pour l\'??cole.
</p>
<p>Ce logiciel est enfaite un assistant virtuel pour handicap?? capable de recevoir des ordres vocals de son utilisateur, de donner une r??ponses ou d\'??ffectuer une
action d??mand??e par ce dernier.Ceci dans le but d\'aider les handicap??s ?? pouvoir ??ffectuer des t??ches dont ils n\'avait pas la possibilit?? Muni d\'algorithme
complexe d\'int??lligence artificielle, ce programme est capable de reconna??tre son utilisateur au d??marrage,
de comprendre ce que vous d??tes et encore mieux, de vous repondre comme un ??tre humain normal. Il est aussi pourvu d\'une capacit?? de contr??le ??
distance de votre maison gr??ce ?? Arduino et ses capteurs.
</p>
<h1 id="fonctionalite">Fonctionalit??s :</h1>
<p>
les fonctionalit??s innonvantes de ce logiciel sont tr??s incroyables dans la mesure o?? elles nous facilitent vraiment la vie. Parmis ces fonctionalit??s nous avons:
<ol type="I">
<li>La Reconnaissance faciale </li>
<p>
D??s son d??marrage, l\'assistant virtuel utilise un algorithme d\'int??lligence artificielle pour vous reconnaitre et s\'assurer que c\'est bien vous avant de pouvoir
lanc?? le logiciel proprement dis!<br>
Ceci peut ce remarquer gr??ce ?? l\'allumage de votre webcam, qui enfaite essaye de d??tecter un visage et le compare ?? ceux de la base de donn??e. <br><br>
Si l\'image d??tect??e n\'est pas reconnue, une image de ce visage est directement enregistr??e dans une base de donn??e diff??rente de celle de l\'utilisateur et
consid??re dor??navant ce visage comme dangereux ou inconnu.

</p>
</ol>
</p>
</body>
</html>'
                    anchors.fill: parent
                    wrapMode: Text.WordWrap
                    font.pointSize: 10
                    padding: 10
                    textFormat: Text.RichText
                }
            }
        }
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;formeditorZoom:0.9;height:480;width:640}D{i:5}
}
##^##*/

