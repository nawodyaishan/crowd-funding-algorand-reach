'reach 0.1';

export const main = Reach.App(() => {

  // Receiver is the address creating the fund to receive currency
  // It is the only participant
  const Receiver = Participant('Receiver', {

    // Gets the parameters of a fund
    // By default, these values are local and private
    receiverAddr: Address,
    deadline: UInt,
    goal: UInt,

    // For indicating to the frontend that the contract is deployed
    // and the fund is ready to receive payments.
    ready: Fun([], Null),
  });

  // Funder API for any address to use.
  // For donating to and getting money back (if fund doesn't reach
  // its goal) from a fund
  const Funder = API ('Funder', {
    // payFund function takes the amount that the funder wants
    // to donate to the fund as a UInt.
    donateToFund: Fun([UInt], Bool),
    // Pays the funder back if the fund didn't reach the goal.
    // Returns the amount the funder previously donated.
    payMeBack: Fun([], Bool),
  });

  // Bystander API for any address to use.
  const Bystander = API ('Bystander', {
    // Indicates that the fund has reached its deadline.
    timesUp: Fun([], Bool),
    // For displaying whether or not fund met its goal.
    getOutcome: Fun([], Bool),
  });

  init();
});