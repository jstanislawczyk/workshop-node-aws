const AWS = require('aws-sdk');

exports.handler = async function(event) {
    const sns = new AWS.SNS();
    const params = buildParams(event);

    await sns.publish(params).promise();
    console.log(`Notification published: ${JSON.stringify(params)}`);
};

const buildParams = (event) => {
    const topicArn = process.env.SNS_TOPIC;

    return {
        Message: JSON.stringify(event),
        TopicArn: topicArn,
    };
};
