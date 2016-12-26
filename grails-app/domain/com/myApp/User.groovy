package com.myApp

import groovy.transform.EqualsAndHashCode
import groovy.transform.ToString

@EqualsAndHashCode(includes='username')
@ToString(includes='username', includeNames=true, includePackage=false)
class User implements Serializable {

	private static final long serialVersionUID = 1

	transient springSecurityService

	String username
	String password
	int age
	double weight
	double lifeStyleMode
	String sex
    double goal
	boolean enabled = true
	boolean accountExpired
	boolean accountLocked
	boolean passwordExpired
	static hasMany = [exercises: Exercise]
    static hasOne = [userKcalInfo: UserKcalInfo]

	static mapping = {
		table 'userTable'
		version false
		id column: 'user_id'
	}

	User(String username, String password) {
		this()
		this.username = username
		this.password = password
	}

	Set<Role> getAuthorities() {
		UserRole.findAllByUser(this)*.role
	}

	def beforeInsert() {
		encodePassword()
	}

	def beforeUpdate() {
		if (isDirty('password')) {
			encodePassword()
		}
	}

	protected void encodePassword() {
		password = springSecurityService?.passwordEncoder ? springSecurityService.encodePassword(password) : password
	}

	static transients = ['springSecurityService']

	static constraints = {
		username blank: false, unique: true
		password blank: false
		age blank:true
		weight blank:true
		lifeStyleMode blank:true
		sex nullable: true;
        goal blank:true;
        userKcalInfo nullable:true;
	}

}
