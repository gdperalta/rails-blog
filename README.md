# README

# **Activities Blog**

The Activitites Blog allows a user to create their own article as an author.

The blog has the following features:

- Create an article that belong to the user
- Comment on any article
- Get random suggestions on article topics
- Have an option to display advertisements(not real) on their article

## **Built with**

- Ruby 3.0.3
- Rails 6.1.4.6
- PostgreSQL 1.1
- Bootstrap 5.1.3
- Webpacker 5.0
- Yarn 1.22.10

## **System dependencies**

- HTTParty 0.20.0
- REST Client 2.1.0
- RSpec-rails 5.1.1
- Devise 4.8.1
- Haml 5.2.2

## **Getting Started**

### **Prerequisites**

The setups steps expect the [System dependencies](#system-dependencies) to be installed on the system

1. Clone the repository

```
git clone https://github.com/gdperalta/rails-blog.git
cd rails-blog
```

2. Install Dependencies

```
bundle install
yarn install
```

3. Initialize the Database

```
rails db:create db:migrate db:seed:all
```

### **Executing the program**

Enter `rails server' in the cli

## **Usage**

### **Create an Article**

Create an article as an author
![create_article][create_article_pic]
![show_article][show_article_pic]

### **Generate Randomly Suggested Topics**

Generate randomly suggested topics per category type with the help of the api wrapper [Activity Generator](#activity-generator)

![activity_generator][activity_generator_pic]

### **Display advertisements chosen in creation of article**

**_Work in progress_**
Choose a type of advertisement you would like to display in your article page
![select_ads][select_ads_pic]
![display_ads][display_ads_pic]

### **Show comments and Add a comment to an article**

- Show comments of the article
- Add a comment to an article

![comments][comments_pic]

## **APIs used**

The following APIs were used for the project

- Activity Generator - [Bored API](https://www.boredapi.com)
- Product - [Fake Store Api](https://fakestoreapi.com)

### **Activity Generator**

`rest-client` was used to fetch the api for this wrapper

The request to the api are listed as follows:

```
API: https://www.boredapi.com/api/activity/
App Route '/activity/random'

def self.randomize
    response = Request.call(http_method: 'get', endpoint: '/')
    new(response)
end


API: https://www.boredapi.com/api/activity?type={type}
App Route '/activity/:type'

def self.type(type)
    response = Request.call(http_method: 'get', endpoint: "?type=#{type}")
    new(response)
end

```

The following types can be entered for the request:

- busywork
- charity
- cooking
- diy
- education
- music
- recreational
- relaxation
- social

### **Product**

`httparty` was used to fetch the api for this wrapper

The request to the api are listed as follows:

```
API: https://fakestoreapi.com/products/:id
App Route '/products/:id'

def self.randomize
    response = Request.call(http_method: 'get', endpoint: '/')
    new(response)
end

```

The api had **20** products that could be request at the time this project was made

## **Deployment**

**_Work in progress_**

## **Tests**

**_Work in progress_**

## Roadmap

- [x] Add Routes for api wrapper requests
- [x] Integrate used api with app
- [ ] Improve layout and input fields for advertisements in article creation form
- [ ] Improve advertisement display in show article view
- [ ] Add tests
- [ ] Deployment

[activity_generator_pic]: docs/img/activity_generator.png
[select_ads_pic]: docs/img/select_ads.png
[display_ads_pic]: docs/img/display_ads.png
[comments_pic]: docs/img/comments.png
[create_article_pic]: docs/img/create_article.png
[show_article_pic]: docs/img/show_article.png
