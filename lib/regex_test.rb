require 'cgi'

def chopString( the_string, length )
  if the_string.nil?
	return nil
  end
  
  if the_string[1].size > length.to_i
	return the_string[1][0..length.to_i].strip
  end
  return the_string[1].strip
end

outfile = File.open("/Users/eddy/temp/test/sql_insert2.sql", 'w')

Dir.foreach("/Users/eddy/temp/test/pdfs/") do |file|
#  puts file
  if file != "." && file != ".."
	str = ""
    raw_data = File.open("/Users/eddy/temp/test/pdfs/" + file, "r+")
	raw_data.each_line do |line|
	  str += line
	end
	
	str = str.gsub("\n", " ")
    
	
	title_match = str.match(/\s\s(.*?)\s\d/)
	date_match = str.match(/(\d\d\s\w.*?\s\d\d\d\d)/)	
	who_match = str.match(/Councillors:\s(.*?)Conta/)	
	contact_match = str.match(/Officer 01273\s\d\d\d\d\d\d\s(.*?)  Contact:/)
	
	title_match = chopString(title_match, 60)
	who_match = chopString(who_match, 60)
	date_match = chopString(date_match, 20)
	str = CGI.escape(str)
	
	if who_match != nil && date_match != nil && title_match != nil
	  str = str.gsub(/\\/, '\&\&').gsub(/'/, "''")
	  outfile.write("INSERT INTO agenda_docs (title, who, strdate, content) VALUES ('" + title_match + "', '" + who_match + "', '" + date_match + "', '" + str + "');")
    end
  end
end


