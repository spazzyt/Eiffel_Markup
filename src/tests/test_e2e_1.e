note
	description: "[
		Test specifically the public routines of the YODA class in the way it is intended to be used by the client.
	]"
	author: "EiffelStudio test wizard"
	date: "$Date$"
	revision: "$Revision$"
	testing: "type/manual"

class
	TEST_E2E_1

inherit
	TEST_INTERFACE
		redefine
			on_prepare,
			on_clean
		end

feature {NONE} -- Events
	test_index_render: STRING
	test_about_render: STRING
	test_index_save: STRING
	test_about_save: STRING


	on_prepare
			-- <Precursor>
		local
			file_index_render: RAW_FILE
			file_about_render: RAW_FILE
			file_index_save: RAW_FILE
			file_about_save: RAW_FILE
		do
			create file_index_render.make_open_read ("./tests/Testdata/test_index_render.txt")
			file_index_render.read_stream (file_index_render.count)
			test_index_render := file_index_render.last_string
			file_index_render.close
			create file_about_render.make_open_read ("./tests/Testdata/test_about_render.txt")
			file_about_render.read_stream (file_about_render.count)
			test_about_render := file_about_render.last_string
			file_about_render.close
			create file_index_save.make_open_read ("./tests/Testdata/test_index_save.html")
			file_index_save.read_stream (file_index_save.count)
			test_index_save := file_index_save.last_string
			file_index_save.close
			create file_about_save.make_open_read ("./tests/Testdata/test_about_save.html")
			file_about_save.read_stream (file_about_save.count)
			test_about_save := file_about_save.last_string
			file_about_save.close
		end


	on_clean
		--<Postcursor>
		local
			yodalib_folder: DIRECTORY
		do
			create yodalib_folder.make ("./yodalib_output")
			if yodalib_folder.exists then
					yodalib_folder.recursive_delete
			end
		end

feature -- Test routines

	test_e2e_1
			-- New test routine
		note
			testing:  "covers/{YODA_PROJECT}.make", "covers/{YODA_PROJECT}.add_document", "covers/{YODA_PROJECT}.render", "covers/{YODA_PROJECT}.print_to_console", "covers/{YODA_PROJECT}.save", "covers/{YODA_PROJECT}.valid_name", "covers/{YODA_PROJECT}.is_valid_template", "covers/{YODA_DOCUMENT}.make", "covers/{YODA_DOCUMENT.add_element", "covers/{YODA_DOCUMENT}}.render", "covers/{YODA_DOCUMENT}.print_to_console", "covers/{YODA_DOCUMENT}.save", "covers/{YODA_DOCUMENT}.save_document"
			testing:  "covers/{YODA_DOCUMENT}.valid_name", "covers/{YODA_DOCUMENT}.is_valid_template", "covers/{YODA}.text", "covers/{YODA}.table", "covers/{YODA}.list", "covers/{YODA}.numbered_list", "covers/{YODA}.bulletpoint_list", "covers/{YODA}.link", "covers/{YODA}.link_intern", "covers/{YODA}.link_extern", "covers/{YODA}.link_anchor", "covers/{YODA}.anchor", "covers/{YODA}.email", "covers/{YODA}.image", "covers/{YODA}.image_local", "covers/{YODA}.image_external", "covers/{YODA}.snippet"
			testing:  "covers/{YODA}.snippet_from_file", "covers/{YODA}.snippet_from_string", "covers/{YODA}.bold", "covers/{YODA}.code", "covers/{YODA}.italic", "covers/{YODA}.quote", "covers/{YODA}.underline", "covers/{YODA}.title", "covers/{YODA_ELEMENT}.validation_languages", "covers/{YODA_ELEMENT}.spaces", "covers/{YODA_ELEMENT}.is_valid_file", "covers/{YODA_ELEMENT}.is_valid_email", "covers/{HTML_VALIDATOR}.validate_image", "covers/{HTML_VALIDATOR}.validate_link", "covers/{HTML_VALIDATOR}.validate_list"
			testing: "covers/{HTML_VALIDATOR}.validate_snippet", "covers/{HTML_VALIDATOR}.validate_table", "covers/{HTML_VALIDATOR}.validate_text", "covers/{HTML_VALIDATOR}.validate_anchor", "covers/{YODA_TABLE}.make", "covers/{YODA_TABLE}.render", "covers/{YODA_TABLE}.as_string", "covers/{YODA_LIST}.make", "covers/{YODA_LIST}.render", "covers/{YODA_LIST}.as_string", "covers/{YODA_LINK}.make_external", "covers/{YODA_LINK}.make_internal", "covers/{YODA_LINK}.make_anchor", "covers/{YODA_LINK}.make_email"
			testing: "covers/{YODA_LINK}.render", "covers/{YODA_IMAGE}.make_local", "covers/{YODA_IMAGE}.make_external", "covers/{YODA_IMAGE}.render", "covers/{YODA_SNIPPET}.make_string", "covers/{YODA_SNIPPET}.make_file", "covers/{YODA_SNIPPET}.render", "covers/{YODA_ANCHOR}.make", "covers/{YODA_ANCHOR}.render", "covers/{TEXT_DECORATOR_BOLD}.make_style", "covers/{TEXT_DECORATOR_BOLD}.render", "covers/{TEXT_DECORATOR_BOLD}.as_string", "covers/{TEXT_DECORATOR_CODE}.make_style", "covers/{TEXT_DECORATOR_CODE}.render"
			testing: "covers/{TEXT_DECORATOR_CODE}.as_string", "covers/{TEXT_DECORATOR_ITALIC}.make_style", "covers/{TEXT_DECORATOR_ITALIC}.render", "covers/{TEXT_DECORATOR_ITALIC}.as_string", "covers/{TEXT_DECORATOR_QUOTE}.make_style", "covers/{TEXT_DECORATOR_QUOTE}.render", "covers/{TEXT_DECORATOR_QUOTE}.as_string", "covers/{TEXT_DECORATOR_TITLE}.make_style_with_attribute", "covers/{TEXT_DECORATOR_TITLE}.render", "covers/{TEXT_DECORATOR_TITLE}.as_string", "covers/{TEXT_DECORATOR_UNDERLINE}.make_style"
			testing: "covers/{TEXT_DECORATOR_UNDERLINE}.render", "covers/{TEXT_DECORATOR_UNDERLINE}.as_string", "covers/{RENDERER}.spaces", "covers/{HTML_RENDERER}.render_text", "covers/{HTML_RENDERER}.render_table", "covers/{HTML_RENDERER}.render_list", "covers/{HTML_RENDERER}.render_link", "covers/{HTML_RENDERER}.render_image_local", "covers/{HTML_RENDERER}.render_image_external", "covers/{HTML_RENDERER}.render_snippet", "covers/{HTML_RENDERER}.render_bold", "covers/{HTML_RENDERER}.render_code"
			testing: "covers/{HTML_RENDERER}.render_italic", "covers/{HTML_RENDERER}.render_quote", "covers/{HTML_RENDERER}.render_title", "covers/{HTML_RENDERER}.render_underline", "covers/{HTML_RENDERER}.render_anchor", "execution/isolated"
		local
			yoda: YODA
			elements_of_list: ARRAY[YODA_ELEMENT]
			index: YODA_DOCUMENT
			about: YODA_DOCUMENT
			yodalib: YODA_PROJECT
			table1: ARRAY2[YODA_ELEMENT]
			table2: ARRAY2[YODA_ELEMENT]
			anchor1: YODA_ANCHOR
			string_array: ARRAY[STRING]
			index_file: RAW_FILE
			about_file: RAW_FILE
			index_output: STRING
			about_output: STRING
		do
			create yoda
			create index.make ("index")
			create about.make ("about")
			create yodalib.make ("yodalib")
			yodalib.add_document (index)
			yodalib.add_document (about)
			index.add_element (yoda.title (yoda.text ("Welcome to the YODA-Homepage"), 1))
			index.add_element (yoda.text ("Let's show what yoda can do:"))
			index.add_element (yoda.title (yoda.text ("Formatting Text"), 2))
			index.add_element (yoda.title (yoda.text ("Inline Formating"), 3))
			index.add_element (yoda.text ("First, you can make your text {{b}}bold{{/b}}, {{i}}italic{{/i}} or {{u}}underline{{/u}} flexible in the text."))
			index.add_element (yoda.underline(yoda.italic(yoda.bold(yoda.text ("And by using the decorators, even all together")))))
			index.add_element (yoda.title (yoda.text ("Preformatted Styling"), 3))
			index.add_element (yoda.text ("Additionally, we offer styling features like this quote from our lord and saviour:"))
			index.add_element (yoda.title (yoda.text ("Quote"), 4))
			index.add_element (yoda.quote (yoda.text ("May the Force be with you, my little padawan")))
			index.add_element (yoda.title (yoda.text ("Code"), 4))
			index.add_element (yoda.code (yoda.text ("Yoda also offers the ability to show code{{n}}even over multiple lines{{n}}like we did here")))
			index.add_element (yoda.title (yoda.text ("Complex Data Structure"), 2))
			index.add_element (yoda.text ("For more complex data, you have the ability to create lists"))
			index.add_element (yoda.title (yoda.text ("Bulletpoint List"), 3))
			elements_of_list := <<yoda.text("First Entry"),yoda.text("Second Entry"), yoda.text("Third Entry")>>
			index.add_element (yoda.bulletpoint_list (elements_of_list))
			index.add_element (yoda.title (yoda.text ("Numbered List"), 3))
			index.add_element (yoda.numbered_list (elements_of_list))
			anchor1 := yoda.anchor ("Table1")
			index.add_element (anchor1)
			index.add_element (yoda.title (yoda.text ("Table"), 3))
			index.add_element (yoda.text ("Or even tables:"))
			create table1.make_filled (yoda.text("Entry"), 5, 4)
			create table2.make_filled (yoda.text("Table in Table"), 2, 2)
			table1[5,1] := yoda.image ("tests/Testdata/yoda.gif")
			table1[5,2] := yoda.numbered_list (elements_of_list)
			table1[5,3] := yoda.list (elements_of_list)
			table1[5,4] := yoda.table (table2)
			index.add_element (yoda.table (table1))
			index.add_element (yoda.title (yoda.text ("Images"), 2))
			index.add_element (yoda.text ("To show fancy stuff, you can link images online or offline"))
			index.add_element (yoda.image_external ("https://www.sideshowtoy.com/wp-content/uploads/2014/05/400080-product-feature.jpg"))
			index.add_element (yoda.title (yoda.text ("Links"), 2))
			index.add_element (yoda.text ("You are free to link to other files in your project or online websites"))
			index.add_element (yoda.title (yoda.text ("External link"), 3))
			index.add_element (yoda.link_external (yoda.text ("Make simple links around texts"), "http://www.jedipedia.wikia.com/wiki/Yoda"))
			index.add_element (yoda.title (yoda.text ("Local link"), 3))
			index.add_element (yoda.link_intern (yoda.text ("Or, link to other documents like this link here"), about))
			index.add_element (yoda.title (yoda.text ("email link"), 2))
			index.add_element (yoda.email ("support@yoda.ch"))
			index.add_element (yoda.title (yoda.text ("Button as link"), 3))
			index.add_element (yoda.link_external (yoda.image_external ("http://icons.iconarchive.com/icons/iconsmind/outline/64/Play-Music-icon.png"), "https://www.youtube.com/watch?v=kDoY_zXf7uQ"))
			index.add_element (yoda.title (yoda.text ("Anchor Link"), 3))
			index.add_element (yoda.link_anchor (yoda.text ("This links up to the table"), anchor1))
			about.add_element (yoda.title (yoda.text ("This is the about us page now :)"), 3))
			about.add_element (yoda.snippet_from_file ("tests/Testdata/snippet.txt"))
			about.add_element (yoda.link_intern (yoda.text ("Take me back to main, my little padawan"), index))
			--End to End Output | Print to Console
--			assert("no solution yet on how to read output to console",false)
			yodalib.print_to_console
			--End to End Output | Index
			string_array := yodalib.render("html")
			assert("Index output is correct", equal(test_index_render, string_array[0]))
			--End to End Output | Index
			assert("About output is correct", equal(test_about_render, string_array[1]))
			--End to End Output | Yodalib
			yodalib.save ("html", "tests/Testdata/template.txt")
			create index_file.make_open_read ("./yodalib_output/index.html")
			index_file.read_stream (index_file.count)
			index_output := index_file.last_string
			index_file.close
			create about_file.make_open_read ("./yodalib_output/about.html")
			about_file.read_stream (about_file.count)
			about_output := about_file.last_string
			about_file.close
			assert("Index saved document is correct", equal(index_output, test_index_save))
			assert("About saved document is correct", equal(about_output, test_about_save))
		end

end


