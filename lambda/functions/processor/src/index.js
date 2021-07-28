const AWS = require('aws-sdk');
const uuid = require('uuid');

exports.handler = async function(event) {
    const s3 = new AWS.S3();
    const params = buildParams(event);

    await s3.putObject(params).promise();
    console.log(`S3 object saved: ${JSON.stringify(params)}`);
};

const buildParams = (event) => {
    const bucketName = process.env.BUCKET_NAME;

    return {
        Body: JSON.stringify(event),
        Bucket: bucketName,
        Key: `${uuid.v4()}.json`,
    };
};
