import chalk from "chalk";

export default class Logger {
  static success(msg: any) {
    console.log(chalk.bgGreen.black(msg));
  }

  static error(err: any) {
    if (err.message) {
      console.log(chalk.bgRed.black(err.message));
    } else {
      console.log(chalk.bgRed.black(err));
    }
  }
}
