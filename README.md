# **Activities Blog**

## **Built with**

![Ruby 3.0.3](https://img.shields.io/badge/Ruby-%3E%3D3.0.3-red) ![Rails 6.1.4.6](https://img.shields.io/badge/Rails-6.1.4.6-red) ![Yarn 1.22.10](https://img.shields.io/badge/Yarn-1.22.10-%232188b6%3B) ![PostgrSQL 12.9](https://img.shields.io/badge/PostgreSQL-12.9-%23336791) ![Bootstrap 5.1.3](https://img.shields.io/badge/Bootstrap-5.1.3-%236610f2)

The Activitites Blog allows a user to create their own article as an author.

The blog has the following features:

- Create an article that belong to the user
- Comment on any article
- Get random suggestions on article topics
- Have an option to display advertisements(not real) on their article

## **System dependencies**

- HTTParty 0.20.0
- REST Client 2.1.0
- RSpec-rails 5.1.1
- Devise 4.8.1
- Haml 5.2.2

## **Getting Started**

### **Prerequisites**

The setups steps expect the Builds listed above to be installed on the system

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

Enter `rails server' in the cli to start the application

## **Usages**

### **Create an Article**

Create an article as an author
![create_article][create_article_pic]
![show_article][show_article_pic]

### **Generate Randomly Suggested Topics**

Generate randomly suggested topics per category type with the help of the api wrapper [Activity Generator](#activity-generator)

![activity_generator][activity_generator_pic]

### **Display advertisements chosen in creation of article**

**_Work in progress_**

Choose a type of advertisement you would like to display in your article page. The advertisements are displayed with the help of the api wrapper [Product](#product)
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

`ActivityGenerator::Request`

```ruby
  class Request
    BASE_URL = 'https://www.boredapi.com/api/activity'

    def self.call(http_method:, endpoint:)
      result = RestClient::Request.execute(
        method: http_method,
        url: "#{BASE_URL}#{endpoint}",
        headers: { 'Content-Type' => 'application/json' }
      )
      handle_errors(result)

      { code: result.code, status: 'Success', data: JSON.parse(result) }
    rescue RestClient::ExceptionWithResponse => e
      { code: e.http_code, status: e.message, data: Error.map(e.http_code) }
    rescue Error::InvalidEndpoint => e
      { code: 404, status: 'Invalid Request', data: JSON.parse(e.message)['error'] }
    end
```

The requests used are listed as follows:

`ActivityGenerator::Client`

Blog App Route: Get '/activity/random'

```ruby

def self.randomize
    response = Request.call(http_method: 'get', endpoint: '/')
    new(response)
end
```

Blog App Route: Get '/activity/:type'

```ruby

def self.type(type)
    response = Request.call(http_method: 'get', endpoint: "?type=#{type}")
    new(response)
end

```

Expected Response for the two requests

```ruby
{
  "code" : 200,
  "status" : "Success",
  "data" : {
    "activity" : string,
    "type" : string,
    "participants" : integer,
    "price" : float,
    "link" : link
    }
}
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

`Product::Request`

```ruby
class Request
    include HTTParty
    base_uri 'https://fakestoreapi.com/products'

    def self.call(endpoint:)
      response = get(
        endpoint,
        headers: { 'Content-Type' => 'application/json' }
      )
      handle_errors(response, endpoint)

      { code: response.code, status: 'Success', data: response }
    rescue Error::InvalidRequest => e
      { code: 404, status: 'Invalid Request', data: e.message }
    rescue Error::InvalidProduct => e
      { code: 404, status: 'Invalid Product', data: e.message }
    end

    def self.handle_errors(response, endpoint)
      raise Error::InvalidRequest, "Cannot GET endpoint: '#{endpoint}'" unless response.success?
      raise Error::InvalidProduct, 'Product does not exist' if response.body == 'null'
    end
  end
```

The requests used are listed as follows:
`Product::Client`

Blog App Route: Get '/products/:id'

```ruby

def self.randomize
    response = Request.call(http_method: 'get', endpoint: '/')
    new(response)
end

```

Response

```ruby
{
  "code" : 200,
  "status":"Success",
  "data" : {
    "id" : 1,
    "title" : string,
    "price": float,
    "description": string,
    "category": string,
    "image": link,
    "rating" : {
      "rate" : float,
      "count" : integer
      }
    }
}
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
