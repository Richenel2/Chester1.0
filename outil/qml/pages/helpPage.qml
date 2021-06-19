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
<li>Fonctionalités </li>
</a>
</ul>
</nav>
<h1 id="apropos"> A propos:</h1>
<p>
<span style="color: white;"> Chester </span> est un logiciel développé par <span style="color: #55aaff;"> KayraDev</span>,
étudiant en deuxiéme année à <b>L\'Ecole Supérieure Internationale de Génie Numérique </b> dans le cardre d\'un concours de projets innovateurs
organiser pour l\'école.
</p>
<p>Ce logiciel est enfaite un assistant virtuel pour handicapé capable de recevoir des ordres vocals de son utilisateur, de donner une réponses ou d\'éffectuer une
action démandée par ce dernier.Ceci dans le but d\'aider les handicapés à pouvoir éffectuer des tâches dont ils n\'avait pas la possibilité Muni d\'algorithme
complexe d\'intélligence artificielle, ce programme est capable de reconnaître son utilisateur au démarrage,
de comprendre ce que vous dîtes et encore mieux, de vous repondre comme un être humain normal. Il est aussi pourvu d\'une capacité de contrôle à
distance de votre maison grâce à Arduino et ses capteurs.
</p>
<h1 id="fonctionalite">Fonctionalités :</h1>
<p>
les fonctionalités innonvantes de ce logiciel sont trés incroyables dans la mesure où elles nous facilitent vraiment la vie. Parmis ces fonctionalités nous avons:
<ol type="I">
<li>La Reconnaissance faciale </li>
<p>
Dés son démarrage, l\'assistant virtuel utilise un algorithme d\'intélligence artificielle pour vous reconnaitre et s\'assurer que c\'est bien vous avant de pouvoir
lancé le logiciel proprement dis!<br>
Ceci peut ce remarquer grâce à l\'allumage de votre webcam, qui enfaite essaye de détecter un visage et le compare à ceux de la base de donnée. <br><br>
Si l\'image détectée n\'est pas reconnue, une image de ce visage est directement enregistrée dans une base de donnée différente de celle de l\'utilisateur et
considére dorénavant ce visage comme dangereux ou inconnu.

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

