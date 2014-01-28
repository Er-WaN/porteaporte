package fr.ps.porteaporte

class InscriptionSeance {
	
	Seance seance
	String prenom
	String nom
	String email
	String phone
	String commentaire
	Date dateInscription = new Date()
	
	static belongsTo = Seance
	
    static constraints = {
		
    }
}
