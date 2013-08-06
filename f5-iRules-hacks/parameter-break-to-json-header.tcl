# Query Parameters break to JSON header insert
when HTTP_REQUEST {
	   if { [HTTP::path] starts_with "/pxl" } {
		
		set piyheaders ""
		  set namevals [split [HTTP::query] "&"]
			for {set i 0} {$i < [llength $namevals]} {incr i} {
				set params [split [lindex $namevals $i] "="]
	    		set pnum [expr $i+1]
				append piyheaders , "\"[lindex $params 0]\" : \"[URI::query [HTTP::uri] [lindex $params 0]]\""
			}
		  HTTP::header insert Lmetric $piyheaders
		  pool  select_XYZ_http_pool
		
		} else {
		  pool  $default_pool
	   
	   }
}
