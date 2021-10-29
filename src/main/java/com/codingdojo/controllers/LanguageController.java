package com.codingdojo.controllers;

import java.util.List;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.codingdojo.models.Language;
import com.codingdojo.services.LanguageService;

@Controller
public class LanguageController {
	private final LanguageService languageService;
	
	public LanguageController (LanguageService languageService){
		this.languageService = languageService;
	}
	
	@RequestMapping("/languages")
	public String index(Model model, @ModelAttribute("language") Language language) {
		List<Language> lans = languageService.allLanguages();
		model.addAttribute("languages", lans);
		return "index.jsp";
	}
	
	@RequestMapping(value="/languages/save", method=RequestMethod.POST)
	public String create(@Valid @ModelAttribute("language") Language language,
						BindingResult result,
						RedirectAttributes redirectAttributes) {
		if (result.hasErrors()) {
			redirectAttributes.addFlashAttribute( "errorMessage", "All spaces are required. The name and the creator should be between 2 and 20 characters long.");
			return "redirect:/languages";
        } else {
        	languageService.saveLan(language);
        	return "redirect:/languages";
        }
	}
	
	@RequestMapping("/languages/edit/{id}")
	public String edit(@PathVariable("id") Long id, 
						Model model, 
						@ModelAttribute("language") Language language) {
		Language lan = languageService.findLan(id);
		if (lan == null) {
			return "redirect:/languages";
		} else {
			model.addAttribute("lan", lan);
			return "edit.jsp";
		}
	}
	
	@RequestMapping(value="/languages/{id}", method=RequestMethod.PUT)
	public String update(@Valid @ModelAttribute("language") Language language,  
						BindingResult result, 
						@PathVariable("id") Long id,
						RedirectAttributes redirectAttributes) {
		if (result.hasErrors()) {
			redirectAttributes.addFlashAttribute( "errorMessage", "All spaces are required. The name and the creator should be between 2 and 20 characters long.");
			String redirect = "redirect:/languages/edit/" + id;
			return redirect;
        } else {
        	languageService.saveLan(language);
        	return "redirect:/languages";
        }
	}
	
	@RequestMapping("/languages/{id}")
	public String show (@PathVariable("id") Long id, Model model) {
		Language lan = languageService.findLan(id);
		if (lan == null) {
			return "redirect:/languages";
		} else {
			model.addAttribute("lan", lan);
			return "language.jsp";
		}
	}
	
	@RequestMapping(value="/languages/remove/{id}")
	public String destroy (@PathVariable("id") Long id) {
		languageService.deleteLan(id);
        return "redirect:/languages";
	}
	
}
