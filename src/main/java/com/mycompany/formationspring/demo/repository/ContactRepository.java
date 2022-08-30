package com.mycompany.formationspring.demo.repository;

import com.mycompany.formationspring.demo.entity.Contact;
import org.springframework.data.repository.CrudRepository;

public interface ContactRepository extends CrudRepository<Contact, Long> {
}
