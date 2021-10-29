package com.codingdojo.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.codingdojo.models.Language;
import com.codingdojo.repositories.LanguageRepository;

@Service
public class LanguageService {
	private final LanguageRepository languageRepository;
	
	public LanguageService(LanguageRepository languageRepository) {
		this.languageRepository = languageRepository;
	}
	
	public List<Language> allLanguages(){
		return languageRepository.findAll();
	}
	
	public Language findLan(Long id) {
		Optional<Language> optionalLan = languageRepository.findById(id);
		if (optionalLan.isPresent()) {
			return optionalLan.get();
		} else {
			return null;
		}
	}
	
	public Language saveLan(Language l) {
		return languageRepository.save(l);
	}
	
	
	public void deleteLan(Long id) {
		languageRepository.deleteById(id);
    	return ;
    }
	
}


