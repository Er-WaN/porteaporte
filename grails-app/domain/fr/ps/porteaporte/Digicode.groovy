package fr.ps.porteaporte

class Digicode {
	
	String code
	String residence
	String adresse
	String porte

    static constraints = {
		adresse nullable: true, blank: true
		residence nullable: true, blank: true
		porte nullable: true, blank: true
    }
}
