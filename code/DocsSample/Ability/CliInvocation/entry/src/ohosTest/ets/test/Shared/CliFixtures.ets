/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

/**
 * Pure model fixtures for the CliInvocation sample.
 *
 * The model mirrors the ohos-aa command construction performed by
 * entry/src/main/cpp/napi_init.cpp, together with the fork/execvp exit code
 * contract (0 success, -1 fork failure, 127 exec failure) and the message
 * keys rendered by pages/Index.ets.
 */

export const CLI_PATH: string = '/system/bin/cli_tool/executable/ohos-aa';
export const SUBCOMMAND_START: string = 'start';
export const SUBCOMMAND_STOP: string = 'force-stop';
export const OPTION_BUNDLE: string = '--bundlename';
export const OPTION_ABILITY: string = '--abilityname';
export const EXIT_SUCCESS: number = 0;
export const EXIT_FORK_FAIL: number = -1;
export const EXIT_EXEC_FAIL: number = 127;
export const NAME_MAX_LENGTH: number = 128;
export const NAME_MIN_LENGTH: number = 3;

export interface CliCommand {
  subcommand: string;
  bundleName: string;
  abilityName: string;
  args: Array<string>;
}

export class CliModel {
  static isValidName(name: string): boolean {
    if (name.length < NAME_MIN_LENGTH || name.length > NAME_MAX_LENGTH) {
      return false;
    }
    return !name.includes(' ') && !name.includes('\t') && !name.includes('\n');
  }

  static isValidBundleName(name: string): boolean {
    return CliModel.isValidName(name) && name.includes('.') && !name.startsWith('.') &&
      !name.endsWith('.');
  }

  static isValidAbilityName(name: string): boolean {
    return CliModel.isValidName(name) && !name.includes('.');
  }

  static isValidExitCode(code: number): boolean {
    return code >= EXIT_FORK_FAIL && code <= 255;
  }

  static buildStartArgs(bundleName: string, abilityName: string): Array<string> {
    const args: Array<string> = [];
    args.push(CLI_PATH);
    args.push(SUBCOMMAND_START);
    args.push(OPTION_BUNDLE);
    args.push(bundleName);
    args.push(OPTION_ABILITY);
    args.push(abilityName);
    return args;
  }

  static buildStopArgs(bundleName: string): Array<string> {
    const args: Array<string> = [];
    args.push(CLI_PATH);
    args.push(SUBCOMMAND_STOP);
    args.push(OPTION_BUNDLE);
    args.push(bundleName);
    return args;
  }

  static buildCommand(bundleName: string, abilityName: string): CliCommand {
    const command: CliCommand = {
      subcommand: SUBCOMMAND_START,
      bundleName: bundleName,
      abilityName: abilityName,
      args: CliModel.buildStartArgs(bundleName, abilityName)
    };
    return command;
  }

  static argCount(args: Array<string>): number {
    return args.length;
  }

  static hasOption(args: Array<string>, option: string): boolean {
    return args.includes(option);
  }

  static optionValue(args: Array<string>, option: string): string {
    const index: number = args.indexOf(option);
    if (index < 0 || index + 1 >= args.length) {
      return '';
    }
    return args[index + 1];
  }

  static formatCommand(args: Array<string>): string {
    return args.join(' ');
  }

  static commandSummary(args: Array<string>): string {
    return 'argc=' + args.length.toString() + ' cmd=' + args[0];
  }

  static isSuccessCode(code: number): boolean {
    return code === EXIT_SUCCESS;
  }

  static isForkFailure(code: number): boolean {
    return code === EXIT_FORK_FAIL;
  }

  static isExecFailure(code: number): boolean {
    return code === EXIT_EXEC_FAIL;
  }

  static exitMessageKey(code: number): string {
    if (code === EXIT_SUCCESS) {
      return 'message_start_success';
    }
    if (code === EXIT_FORK_FAIL) {
      return 'message_start_failed_fork';
    }
    if (code === EXIT_EXEC_FAIL) {
      return 'message_start_failed_exec';
    }
    return 'message_start_failed';
  }

  static exitMessage(code: number, value: number): string {
    if (code === EXIT_SUCCESS) {
      return 'start success';
    }
    return 'start failed, ret = ' + value.toString();
  }

  static isSafeArg(arg: string): boolean {
    return arg.length > 0 && !arg.includes(';') && !arg.includes('&') &&
      !arg.includes('|') && !arg.includes('`');
  }

  static decodeWaitStatus(status: number): number {
    if (status < 0) {
      return EXIT_FORK_FAIL;
    }
    const code: number = status >> 8;
    return code < 0 ? EXIT_FORK_FAIL : code;
  }

  static normalizeBundle(name: string): string {
    return name.trim();
  }

  static appendOption(args: Array<string>, option: string, value: string): Array<string> {
    const result: Array<string> = args.slice();
    result.push(option);
    result.push(value);
    return result;
  }

  static isValidCommand(command: CliCommand): boolean {
    return CliModel.isValidBundleName(command.bundleName) &&
      CliModel.isValidAbilityName(command.abilityName) &&
      command.args.length > 0;
  }
}
