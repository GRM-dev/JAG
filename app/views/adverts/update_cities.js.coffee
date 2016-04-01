$("#advert_city_id")
  .empty()
  .append('<option>Wybierz miasto ...</option>')
  .append("<%= j(render(:partial => @cities)) %>")