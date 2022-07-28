# swift-serverless-rest-api-aws-lambda-swift-runtime-amzlinux2-arm64
</BR>
<img width="850" alt="aws-lambda-swift " src="https://user-images.githubusercontent.com/102517671/180840050-becf4230-6b32-4be3-ae84-d8b88c1887c8.png">

</BR>
Swift Server Implementation - RESTful APIs, AWS Lambda Serverless For Swift Runtime amazonlinux: AWS Lambda + API Gateway deployed on Graviton arm64 build **swift:5.6.2-amazonlinux2-docker image** </BR></BR>

Utilizing New AsyncLambdaHandler feature to support latest structured concurrency pattern: **async/await**  (Swift 5.5+) 
</BR>
For any detail about Server-Side-Swift and Lambda-Serverless solutions, Please check [here](https://docs.google.com/document/d/1GlGv0avpbpE6lqJbpxz5iHgaiPMC5E543rYGg5Ionbw/edit?usp=sharing)  </BR></BR>

Just upload "lambda.zip" to AWS Lambda via S3 bucket file (direct lambda upload limit is 10MB) </BR>
AWS CLI command to update (IAM Role needs to be configured with required lambda & s3 permissions ): </BR>
`aws lambda update-function-code --function "$lambda_function_name" --s3-bucket "$s3_bucket_name" --region=us-east-1 --s3-key lambda.zip`   
</BR>
Set Environment variable for MongoDB Cloud database via Lambda configuration -> Environments Variables: `DATABASE_URL "mongodb:url_connect_database"` </BR>
We can use MongoDB Atlas Cloud managed solution - [Free Shared Instance](https://www.mongodb.com/blog/post/free-your-genius-on-mongodb-atlas-free-tier)
</BR>
Connect an API gateway with Route: </BR>
/api/entity/{model} </BR></BR>
Any Entity as json request can be created/updated/read,  to/from the MongoDB database </BR>
exp: </BR>

Make **CRUD Operations** simpler, with options for custom object validation. APIGateway also provide custom json object mapping for request validation</BR>
[ ANY ]  /api/entity/model
</BR></BR>
[ POST ]  /api/entity/users </BR>
[ GET ] /api/entity/users?sort=created_at&order=desc&limit=20 </BR>
[ GET ] /api/entity/users/id </BR>
[ PUT ] /api/entity/users/id </BR>
[ DELETE ] /api/entity/users/id </BR>

</BR> 
Inpired by Facebook's Cloud Database Project: "Parse" </BR>
( Parse Project was shutdown almost 3 years back but it provide different solutions to update data from frontend applications in the form of enitiy model classes ) </BR></BR>

- Strongly typed feature of Swift for stable and faster development </BR>
- Easy deployment to AWS Serverless Lambda without any server maintenance </BR>
- Build in security by using APIGateway to access the server RESTful APIs </BR>
- MongoDB NoSql Schema-less database integration to consume json-based services </BR>
- No DataModeling used: So No data migration changes require when adding new (key,value) pair to a collection / table. </BR>
- Any json can be added to any collection - completely dynamic system </BR>
- Any custom validations can be used for any specific resources like: users,bookings,  etc. </BR></BR>



## Using Swift with Lambda and AWS </BR></BR>
AWS Lambda supports a couple programming languages natively. This means you can upload the source code directly and AWS Lambda can compile it on the fly. Unfortunately, this isn’t yet the case for Swift. So, for Swift to run on AWS Lambda, you need to: </BR>
- Compile the function as an executable file that runs on Amazon Linux 2. </BR>
- Include all dependencies and libraries with the bootstrap file. </BR>
- You’ll use Docker to do that, and i have provided you with a convenient ZIP file of your function and its dependencies that you upload to AWS Lambda. </BR>
- AWS Lambda does come with a few limitations: </BR>
- AWS Lambda functions run for a maximum of 15 minutes. </BR>
- A function may take a few extra seconds to run for the first time since AWS Lambda is booting the function. This is also referred to as a “cold start”. </BR>
- AWS Lambda is, by definition, stateless; there’s no shared memory among AWS Lambda functions. </BR>
- AWS Lambda functions can perform a variety of tasks, so not every AWS Lambda function is a public function. Depending on your use case, you may not even need internet access. </BR>
- AWS Lambda functions can use EventLoops, but they’re usually used within a specific context only. </BR></BR>



</BR>
**Working On**
</BR>
* JWT authorization integration. Options are:
  * APIGateway Authorizer for any specific route
  * Custom implementation is pretty much dynamic. Using JWT Library dependency but it may add an additional cold start time for boot up.
* CI/CD for one-click/command deploy updates to Lambda func </BR>
* Verify Apple claims in WWDC: [Static Linking for Linux Optimize Lambda Performance](https://www.linkedin.com/posts/muhammad-furqan-121b691a_swiftonserver-swift-server-activity-6954367874148749312-JBrD?utm_source=linkedin_share&utm_medium=member_desktop_web) </BR>
  * Static Linking for Linux to achieve: </BR>
    * 33% faster cold start time on AWS Lambda </BR>
    * 40% faster invocation time for APIGateway Lambda</BR></BR>



</BR>Any Feedback, suggestion, improvisation is welcomed</BR>

</BR></BR>
**Created By**, </BR>
Furqan </BR>
(Software Developer / Solution Architect) </BR>
Email: furqan.cloud.dev@gmail.com </BR></BR>

