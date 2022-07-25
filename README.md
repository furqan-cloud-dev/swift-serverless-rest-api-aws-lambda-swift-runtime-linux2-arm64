# swift-serverless-rest-api-aws-lambda-swift-runtime-linux2-arm64
Swift Server Implementation - RESTful APIs, AWS Lambda Serverless For Swift Runtime amazonlinux: AWS Lambda + API Gateway deployed on Graviton arm64 build swift:5.6.2-amazonlinux2-docker image </BR>

Link of Zipped Lambda file: https://drive.google.com/file/d/153GBRqAkzLtN2xPIhnzrMVR3shSu9Lb1/view?usp=sharing </BR>
Just upload to AWS Lambda via S3 bucket file </BR>
Set Environment variable for MongoDB Cloud database: DATABASE_URL "mongodb:url_connect_database" </BR>
Connect A API gateway with Route: </BR>
/api/enitity </BR>
Any Entity as json request can be created/updated/read to/from the MongoDB database </BR>
Like: </BR>
[ POST ]  /api/enitity/users </BR>
[ GET ] /api/enitity/users </BR>
 
Inpired by Facebook's Cloud Database Project: "Parse" </BR>

- Strongly typed feature of Swift for stable and faster development </BR>
- Easy deployment to AWS Serverless Lambda without any server maintenance </BR>
- Build in security by using APIGateway to access the server RESTful APIs </BR>
- MongoDB NoSql Schema-less database integration to consume json-based services </BR>
- No DataModeling used: So No data migration changes require when adding new (key,value) pair to a collection / table. </BR>
- Any json can be added to any collection - completely dynamic system </BR>
- Any custom validations can be used for any specific resources like: users,bookings,  etc. </BR></BR>


</BR>
Working on JWT authorization integration, we can use this feature through APIGateway but the custom solution is pretty much dynamic.
