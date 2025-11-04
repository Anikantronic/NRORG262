Agtergrond

Funksie 1:

Sekere string soek-oplossings vereis dat alle karakters in 'n string alles verander word na klein letters. Dieselfde tipe funksie vereis ook dat enige leestekens uit 'n sin verwyder word.

Byvoorbeeld: "Wat gebeur met hierdie sin?" verander na "wat gebeur met hierdie sin". Let op dat die hoofletter 'W' verander is na klein letter en dat '?' verwyder is, maar spasie karakters en ander alfabet karakters bly.

Skep 'n funksie wat die volgende prototipe sal implementeer: void verklein(char* bronSkikking, char* bestemmingSkikking, int aantalElemente)

Die funksie moet 'n bestemmingSkikking genereer gegewe die reëls wat volg.
Die bestemmingSkikking moet slegs klein letters bevat. Enige hoofletter in bronSkikking moet verander word na kleinletters.
Ons kan aanneem dat die bestemmingSkikking ten minste 500 karakters se spasie geallokeer is.
Enige leestekens moet nie in die bestemmingSkikking gestoor word nie.
Enige syfers en spasies, moet netso oorgedra word na die bestemmingSkikking.
Funksie 2:

Die tweede funksie moet 'n bestemmingSkikking genereer wat elke karakter n-keer herhaal, gegewe hulle posisie in die bronSkikking.

Byvoorbeeld: Die sin abc verander na abbccc. a is in posisie 1, b is in posisie 2 en c is in posisie 3. Dit beteken a het een keer herhaal, b het twee keer herhaal en c drie keer.

Skep 'n funksie wat die volgende prototipe sal implementeer: void verleng(char* bronSkikking, char* bestemmingSkikking,int aantalElemente)

Die funksie moet 'n bestemmingSkikking genereer gegewe die reëls wat volg.
Die bestemmingSkikking kan enige karakter bevat.
Ons kan aanneem dat die bestemmingSkikking ten minste 500 karakters se spasie geallokeer is.
Die posisie van die karakters in die bronSkikking moet n-keer herhaal in die bestemmingSkikking gegewe hulle numeriese posisie in die bronSkikking
Opdrag:

Skryf 'n saamsteltaal program wat die gebruiker vra om twee stringe in te voer. Die eerste string moet verklein word en die tweede string moet verleng word.
Skryf 'n verklein funksie en 'n verleng funksie soos hier bo aangedui.
Die funksies MOET NIE die globale skikkings direk adresseer nie. Die funksies MOET die skikkings adresseer deur gebruik te maak van die parameters van die funksie. Funksies wat direk die globale veranderlikes adresseer sal met vyf punte gepenaliseer word.
Nadat die tweede string ingevoer is, moet die saamsteltaal program die verklein en verleng funksies roep wat die twee bron-string-skikkings sal omskakel na twee aparte bestemming string-skikkings toe.
Die funksies MOET NIE van globale veranderlikes gebruik maak nie, behalwe vir konstante veranderlikes en die string skikkings. Enige veranderlikes moet lokaal tot die funksie gedefinieer word.
