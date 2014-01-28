import fr.ps.porteaporte.Quartier;
import fr.ps.porteaporte.Seance
import fr.ps.porteaporte.User
import fr.ps.porteaporte.Role
import fr.ps.porteaporte.UserRole

class BootStrap {

   def init = { servletContext ->

      def administrateurRole = new Role(authority: 'ROLE_ADMINISTRATEUR').save(flush: true)
      def militantRole = new Role(authority: 'ROLE_MILITANT').save(flush: true)

      def administrateur = new User(username: 'erwanthouvenot@gmail.com', password: 'erwan', nom: 'Thouvenot', prenom: 'Erwan')
	  def militant = new User(username: 'sally.claret@gmail.com', password: 'sally', nom: 'Claret', prenom: 'Sally')
      administrateur.save(flush: true)
	  militant.save(flush: true)
	  
	  def quartier1 = new Quartier(nom: 'Centre ville')
	  def quartier2 = new Quartier(nom: 'Les blanches')
	  def quartier3 = new Quartier(nom: 'Tonkins')
	  def quartier4 = new Quartier(nom: 'La main de fer')
	  def quartier5 = new Quartier(nom: 'Centre ville')
	  quartier1.save(flush: true)
	  quartier2.save(flush: true)
	  quartier3.save(flush: true)
	  quartier4.save(flush: true)
	  quartier5.save(flush: true)
	  
	  def seance = new Seance(quartier: Quartier.get(1), commentaire: "RAS", nombrePorteFrappes: 0, nombrePorteOuvertes: 0, nombreQuestionnaires: 0, etat: 1, createur: administrateur, dateSeance: Calendar.getInstance()).save(flush: true)
      UserRole.create administrateur, administrateurRole, true
	  UserRole.create militant, militantRole, true
	  
   }
   
   
}

