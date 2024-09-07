package com.TODO;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ToDoController {

	@Autowired
	ToDoDao tododao;

	@GetMapping("/")
	public ModelAndView loadHomePage() {
		return new ModelAndView("Home");
	}

	@PostMapping("/saveData")
	public ModelAndView saveData(@ModelAttribute ToDoBo bo) {
		tododao.save(bo);
		return new ModelAndView("Home");
	}

	@GetMapping(value = "/getData")
	public @ResponseBody List<ToDoBo> getData() {
		return tododao.getAll();
		// return list;
	}

	@GetMapping(value = "/delete/{id}")
	public ModelAndView deleteData(@PathVariable("id") int id) {
		tododao.delete(id);
		return new ModelAndView("Home");
	}

//	@GetMapping(value = "/getData")
//	public ModelAndView getData() throws JsonProcessingException {
//		List<ToDoBo> list=tododao.getAll();
//		ObjectMapper objectMapper = new ObjectMapper();
//	    objectMapper.enable(SerializationFeature.INDENT_OUTPUT);
//	    String arrayToJson = objectMapper.writeValueAsString(list);
//		return new ModelAndView ("Home","list",arrayToJson);	}
}
