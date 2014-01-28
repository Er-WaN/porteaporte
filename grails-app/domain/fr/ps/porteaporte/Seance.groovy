package fr.ps.porteaporte

import liquibase.database.structure.type.VarcharType;

class Seance {
	Date dateSeance
	Quartier quartier
	String rue
	String residence
	Integer nombrePorteFrappes = 0
	Integer nombrePorteOuvertes = 0
	Integer nombreQuestionnaires = 0
	String  commentaire
	String  commentaire_cloture
	Integer etat = 1
	User createur

	static hasMany = [participant:InscriptionSeance]

	static constraints = {
		etat nullable: true, defaultValue : 1
		rue nullable: true, blank: true
		residence nullable: true, blank: true
		nombrePorteFrappes nullable: true, defaultValue : 0
		nombrePorteOuvertes nullable: true, defaultValue : 0
		nombreQuestionnaires nullable: true, defaultValue : 0
		commentaire_cloture nullable: true, defaultValue : ""
		createur nullable: true
	}


	static mapping = {
	}
}
