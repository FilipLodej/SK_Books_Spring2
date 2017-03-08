package pl.spring.demo.controller;




import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import pl.spring.demo.constants.ViewNames;
import pl.spring.demo.service.BookService;
import pl.spring.demo.to.BookTo;


/**
 * Book controller
 * 
 * @author mmotowid
 *
 */
@Controller
@RequestMapping("/books")
public class BookController {
	
	@Autowired
	BookService bookService;

	@RequestMapping
	public String list(Model model) {
		model.addAttribute("bookList", bookService.findAllBooks());
		return ViewNames.BOOKS;
	}

	/**
	 * Method collects info about all books
	 */
	@RequestMapping("/all")
	public ModelAndView allBooks() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName(ViewNames.BOOKS);
		modelAndView.addObject("bookList", bookService.findAllBooks());
		return modelAndView;
	}

	@RequestMapping("/search")
	public ModelAndView searchBook(){
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName(ViewNames.SEARCH);
		return modelAndView;
	}
	
	@RequestMapping("/search/results")
	public ModelAndView searchBookResults(@RequestParam(required=false) String title, 
			@RequestParam(required=false) String author){
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName(ViewNames.SEARCH_RESULTS);
		modelAndView.addObject("results", bookService.searchByTitleOrAuthors(title, author));
		return modelAndView;
	}
	
	@RequestMapping("/book/{id}")
	public ModelAndView showBookDetails(@PathVariable ("id") Long id){
		ModelAndView modelAndView=new ModelAndView();
		modelAndView.setViewName(ViewNames.BOOK);
		modelAndView.addObject("book", bookService.findBookById(id));
		return modelAndView;
	}

	// TODO: Implement GET / POST methods for "add book" functionality
	@RequestMapping(value="/add", method=RequestMethod.GET)
	public String addNewBook(Model model){
		BookTo book=new BookTo();
		model.addAttribute("newBook", book);
		return "addBook";

	}
	@RequestMapping(value="/add", method=RequestMethod.POST)
	public String addNewBookForm(@ModelAttribute ("newBook") BookTo book){
		bookService.saveBook(book);
		return "redirect:/books";
	}
	
	@RequestMapping("/removed_book/{id}")
	public ModelAndView removeBook(@PathVariable ("id") Long id){
		ModelAndView modelAndView=new ModelAndView();
		modelAndView.setViewName(ViewNames.REMOVED_BOOK);
		modelAndView.addObject("book", bookService.findBookById(id));
		bookService.deleteBook(id);
		return modelAndView;
	}
	/**
	 * Binder initialization
	 */
	@InitBinder
	public void initialiseBinder(WebDataBinder binder) {
		binder.setAllowedFields("id", "title", "authors", "status");
	}

}
