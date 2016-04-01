$("#advert_city_id").empty()
  .append("<%= escape_javascript(render(:partial => @cities)) %>")