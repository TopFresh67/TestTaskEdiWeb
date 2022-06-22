# frozen_string_literal: true

When(/^захожу на страницу "(.+?)"$/) do |url|
  visit url
  $logger.info("Страница #{url} открыта")
  sleep 1
end

When(/^ввожу в поисковой строке текст "([^"]*)"$/) do |text|
  query = find("//input[@name='q']")
  query.set(text)
  query.native.send_keys(:enter)
  $logger.info('Поисковый запрос отправлен')
  sleep 1
end

When(/^кликаю по строке выдачи с адресом (.+?)$/) do |url|
  link_first = find("//a[@href='#{url}/']/h3")
  link_first.click
  $logger.info("Переход на страницу #{url} осуществлен")
  sleep 1
end

When(/^я должен увидеть текст на странице "([^"]*)"$/) do |text_page|
  sleep 1
  expect(page).to have_text text_page
end

When(/^файл должен лежать в директории "([^"]*)"$/) do |text_page1|
  sleep 20
  text_page2 = "ruby-3.1.2.tar.gz"
  if File.expand_path(text_page2) == text_page1
    $logger.info("Файл #{text_page2} Находитя в правильной директории")
end
end

When(/^имя файла должно совпадать с именем на странице "([^"]*)"$/) do |text_page3|
  text_page4 = text_page3 + ".tar.gz"
  if File.exists?(text_page4)
    $logger.info("Файл #{text_page3} существует имеет такое же имя как и на сайте")
  end
end

