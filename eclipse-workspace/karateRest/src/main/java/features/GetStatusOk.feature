Feature: Validate all scenaries from the training of TAE Back-end
Background:
    * url 'https://jsonplaceholder.typicode.com/'
    
    
Scenario: get status code from main page
When method get
Then status 200


Scenario: get response from resource 'Posts' and compare structure
Given  path 'posts'
When method get
And match each response == {"userId":'#number',"id":'#number',"title":'#string',"body": '#string'}


Scenario: get response from resource 'Comments' and compare structure
Given  path 'comments'
When method get
And match each response == {"postId":'#number',"id":'#number',"name":'#string',"email":'#string', "body": '#string'}


Scenario: get response from resource 'albums' and compare structure 
Given  path 'albums'
When method get
And match each response == {"userId":'#number',"id":'#number',"title":'#string'}


Scenario: get response from resource 'photos' and compare structure 
Given  path 'photos'
When method get
And match each response == {"albumId":'#number',"id":'#number',"title":'#string',"url": '#string', "thumbnailUrl": '#string'}

Scenario: get response from resource 'Todos' and compare structure 
Given  path 'todos'
When method get
And match each response == {"userId":'#number',"id":'#number',"title":'#string',"completed": '#boolean'}


Scenario: get response from resource 'Users' and compare structure 
Given  path 'users'
When method get
And match each response == {"id":'#number', "name":'#string', "username": '#string', "email":'#string', "address":{ 	"street":	'#string',     "suite":	'#string', 	"city":		'#string', 	"zipcode":	'#string', 	"geo":{ 			"lat": '#string', 	        "lng": '#string' 	} }, "phone":'#string', "website":'#string', "company":{ 	"name":'#string',     "catchPhrase":'#string',     "bs":'#string' 	}  }
  

	
Scenario: get response from resource 'Posts' and compare structure with the ids 20,50,100
Given path 'posts' 
And param id = 20,50,100
When method get
And print response 
