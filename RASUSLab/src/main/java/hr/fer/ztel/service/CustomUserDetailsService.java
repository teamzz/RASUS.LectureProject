package hr.fer.ztel.service;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import hr.fer.ztel.dao.ProfessorDao;
import hr.fer.ztel.domain.Professor;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * Razred mapiran servisom, sluzi za citanje login podataka iz baze potrebnih Spring
 * Security-u
 * Logika u metodi loadUserByUsername
 *
 */
@Service("customUserDetailsService")
@Transactional
public class CustomUserDetailsService implements UserDetailsService {

	@Autowired
	private ProfessorDao profDao;
	
	@Override
	public UserDetails loadUserByUsername(String username)
			throws UsernameNotFoundException {

		Professor professor = profDao.getProfessorByUsername(username);

		boolean enabled = true;
		boolean accountNonExpired = true;
		boolean credentialsNonExpired = true;
		boolean accountNonLocked = true;


		return new User(professor.getUsername(), professor.getPassword(),
				enabled, accountNonExpired, credentialsNonExpired,
				accountNonLocked, getAuthorities());
	}

	public Collection<SimpleGrantedAuthority> getAuthorities() {
		List<SimpleGrantedAuthority> authorities = new ArrayList<SimpleGrantedAuthority>();
		authorities.add(new SimpleGrantedAuthority("ROLE_ADMIN"));
		return authorities;
	}

}
