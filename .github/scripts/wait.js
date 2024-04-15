const sleep = (milliseconds) => {
  return new Promise((resolve) => setTimeout(resolve, milliseconds));
};

module.exports = async ({ context }) => {
  console.log(context.sha);
  console.log(context.eventName);
  console.dir(context, { depth: null });
  await sleep(30 * 1000);
};
