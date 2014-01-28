package fr.ps.porteaporte

class User {

	transient springSecurityService

	String username
	String password
	String prenom
	String nom
	boolean enabled = true
	boolean accountExpired
	boolean accountLocked
	boolean passwordExpired

	static transients = ['springSecurityService']

	static constraints = {
		username blank: false, unique: true
		password blank: false
	}

	static mapping = {
		password column: '`password`'
	}

	Set<Role> getAuthorities() {
		UserRole.findAllByUser(this).collect { it.role } as Set
	}

	def beforeInsert() {
		encodePassword()
	}

	def beforeUpdate() {
		if (password != null) {
			if (isDirty('password')) {
				encodePassword()
			}
		}
	}

	protected void encodePassword() {
		password = springSecurityService.encodePassword(password)
	}
}
