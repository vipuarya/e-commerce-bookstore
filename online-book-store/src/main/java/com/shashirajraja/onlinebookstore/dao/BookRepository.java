package com.shashirajraja.onlinebookstore.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;

import com.shashirajraja.onlinebookstore.entity.Book;

@RepositoryRestResource
public interface BookRepository extends JpaRepository<Book, Integer> {

	
	@Query("from Book b where b.deleted=false and lower(b.bookDetail.type) like :search")
	List<Book> searchBooksByType(@Param("search") String search);

	@Query("from Book where deleted=false and lower(name) like :search")
	List<Book> searchBooks(@Param("search") String search);

	@Query("from Book where deleted=false")
	List<Book> getNonDeletedBooks();

}
