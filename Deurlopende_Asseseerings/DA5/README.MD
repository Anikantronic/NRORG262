Agtergrond inligting
Sellulêre outomata word in rekenaarwetenskap gebruik om ewekansigheid te beskryf, maar dit word ook gebruik in simulasies van omgewings.  Een van die mees bekensde selulêre outomata is Conway se Game of Life.  'n Meer eenvoudige selulêre outomata wat slegs 'n een dimensionele skikking verander is Rule 60.

Rule 60 pas 'n stel reels toe wat kyk na drie selle op 'n slag: Die huidige sel, die vorige sel en die volgende sel.  Die ooreenstemmende sel in die bestemming skikking verander deur die volgende reels op die bron skikking se aktiewe sel toe te pas:



Huidige patroon                   111 110 101 100 011 010 001 000

Nuwe toestand vir die middel sel   0   0   1   1   1   1   0   0

Byvoorbeeld: Veronderstel ons het 'n skikking van vyf karakters.  Kom ons noem hierdie skikking: Skikking 1: "00100".  Ons moet nou 'n rondte evolusie op Skikking 1 toepas, wat beteken ons skep nou 'n Skikking 2, wat die waardes van Skikking 1 sal stoor, na die evolusie plaasgevind het.  Ons kan die items in Skikking 1 beskryf volgens hulle indekse.  Die volgende tabel wys hoe Skikking 1 sal omskakel na Skikking 2 toe.

Gedurende evolusie bereken ons nuwe waardes vir elke indeks n in Skikking 2. Indeks n van Skikking 2 se waarde word bepaal deur die waardes van indekse (n-1,n,n+1) van Skikking 1.  Byvoorbeeld: As n=0, beteken dit ons kyk na Skikking 1 se waardes in indekse (-1,0,1):  Ons gebruik gebruik egter die waarde 0, vir die item by indeks -1, omdat dit buite die grense van ons huidige skikking is. Dit gee vir ons die waardes (0,0,0) (Kyk na die patrone hierbo).  Dus, volgens Rule 60, is die Skikking2[0] = 0. Skikking 2[1] se waarde word bepaal deur indekse (0,1,2) van Skikking 1.  Dit is waardes (0,0,1). Dus, volgens Rule 60, is Skikking2[1]=0. En so gaan ons aan.  Ons aanvaar 'n waarde van 0 vir indekse buite die skikking se grense.

           	0	1	2	3	4
Skikking 1	0	0	1	0	0
Skikking 2	0	0	1	1	0
 

Opdrag
In hierdie opdrag word 'n basis program aan jou verskaf.  Die basis program lees die aantal elemente van die skikkings en vra ook vir die aantal evolusies wat moet plaasvind op die skikkings, asook die eerste weergawe van die skikking.

Na al die invoere ingelees is, vertoon dit die eerste versie van die skikking en veroorsaak die Rule60 evolusie op die skikking. Die evolusie word herhaal vir die hoeveelheid iterasies wat moet plaasvind.  Die hoof program maak gebruik van twee skikkings. Daar is altyd 'n aktiewe skikking, wat die bron is.  Die bestemming skikking se elemente moet verander word gegewe die Rule60 reels op die bron skikking.

Skryf vier 80x86 verskillende funksies wat benodig word om die program suksesvol te voltooi.  Die vier funksies word hieronder beskryf.
Geen verdere globale veranderlikes mag gebruik word nie.  Gebruik lokale veranderlikes soos benodig.
Oplossings wat nie suksesvol saamstel nie, word beperk tot 'n maksimum van 40%. Sit maar kommentaar in die hoofprogram soos die funksies geskep word.
Die Invoer koppelvlak kan soos volg lyk. In die skermskoot word 0100000000 ingelees en die stelsel hardloop vir een iterasie.

Om die ontwikkeling te bespoedig word die hoof program gegee wat die vier funksies roep. Die inligting hieronder is c++ taal, sodat dit duidelik is, dat van die parameters 'n adres bevat van skikkings.

//Vertoon 'n skikking van totalElements. 
//Elke element moet reg langs die vorige een vertoon word.
//Na al die elemente vertoon is, moet 'n nuwe lyn begin word.
// parameter 1: Die adres na die skikking toe
// parameter 2: 'n Heelgetal wat die aantal elemente in die skikking voorstel
void vertoon(int* skikking, int aantalElemente)

//Invoer por die gebruiker vir aantalElemente waardes
//Elke element moet in die skikking gestoor word
// parameter 1: Die adres na die skikking toe
// parameter 2: 'n Heelgetal wat die aantal elemente in die skikking voorstel
void invoer(int* skikking, int aantalElemente)

// Die uitvee funksie gee al die elemente in 'n skikking 'n nul waarde.
// parameter 1: Die adres na die skikking toe
// parameter 2: 'n Heelgetal wat die aantal elemente in die skikking voorstel
void uitvee(int* skikking, int aantalElemente)

// Die omskakel funksie pas die Rule30 toe.  Die bestemmingSkikking word verander deur die Rule30
// toe te pas op die bronSkikking
// parameter 1: Die adres na die bron skikking toe
// parameter 2: Die adres na die bestemming skikking toe
// parameter 3: 'n Heelgetal wat die aantal elemente in die skikking voorstel
void omskakel(int* bronSkikking, int* bestemmingSkikking, int aantalElemente)
Die volgende JAVA kode (wat in saamsteltaal vertaal is) word reeds verskaf in die templaat.  Die kode roep outomaties die funksies wat die nodige werk doen.

public static void main(String[] args) {
        int aktieweSkikking = 0;
        int aantalElemente = 0;
        int aantalIterasies = 0;
        final int TOTAAL_ITEMS = 100;

        Skikking0 = new int[TOTAAL_ITEMS];
        Skikking1 = new int[TOTAAL_ITEMS];

        uitvee(Skikking0, TOTAAL_ITEMS);
        uitvee(Skikking1, TOTAAL_ITEMS);

        System.out.println("Hoeveel elemente moet die skikking bevat:");
        aantalElemente = input.nextInt();
        System.out.println("Hoeveel iterasies moet vertoon word:");
        aantalIterasies = input.nextInt();
        
        invoer(Skikking0, aantalElemente);
        vertoon(Skikking0, aantalElemente);

        for(int i=0;i<aantalIterasies;i++) {
            if(aktieweSkikking==0) {
                omskakel(Skikking0, Skikking1, aantalElemente);
                vertoon(Skikking1,aantalElemente);
                aktieweSkikking=1;
            }else{
                omskakel(Skikking1, Skikking0, aantalElemente);
                vertoon(Skikking0, aantalElemente);
                aktieweSkikking=0;
            }
        }
    }
