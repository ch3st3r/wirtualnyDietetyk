import com.myApp.User;
import com.myApp.Role;
import com.myApp.UserRole;
import com.myApp.Product;
import com.myApp.Sport;

class BootStrap {

    def init = { servletContext ->
        def userRole = Role.findByAuthority('ROLE_USER') ?: new Role(authority: 'ROLE_USER').save(failOnError: true)
        def adminRole = Role.findByAuthority('ROLE_ADMIN') ?: new Role(authority: 'ROLE_ADMIN').save(failOnError: true)

        def admin = new User('admin', 'password').save(flush:true);
        def u1 = new UserRole(admin, adminRole).save(flush:true);

        def rise = new Product('ryż biały długoziarnisty', 100, 'g', 357, 7.9, 79, 0.9).save(flush: true);
        def cheese = new Product('ser zółty', 100, 'g', 380, 28.8, 0.1, 29.7).save(flush:true);
        def ham = new Product('szynka gotowana', 100, 'g', 103, 20, 1.1, 2.1).save(flush:true);
        def oil = new Product('oliwa', 100, 'ml', 822, 0, 0, 91.6).save(flush:true);

        def volleyball = new Sport('siatkowka', 150).save(flush:true);
        def football = new Sport('football', 200).save(flush:true);
        def basketball = new Sport('koszykówka', 100).save(flush:true);
        def tennis = new Sport('tenis', 250).save(flush:true);
        def curling = new Sport('curling', 75).save(flush:true);
    }

    def destroy = {
    }
}
