/*
 * Copyright (c) 2022-2026 Sample Device Co., Ltd.
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

import hilog from '@ohos.hilog';
import TestRunner from '@ohos.application.testRunner';
import AbilityDelegatorRegistry from '@ohos.application.abilityDelegatorRegistry';

const DOMAIN: number = 0xF811;
const TAG: string = 'BrowserTestRunner';
const FORMAT: string = '%{public}s';

/** Name of the ability that hosts the hypium suites. */
const TEST_ABILITY: string = 'TestAbility';

let abilityDelegator = undefined;
let abilityDelegatorArguments = undefined;

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, FORMAT, message);
}

function logError(message: string): void {
  hilog.error(DOMAIN, TAG, FORMAT, message);
}

/**
 * Whitelist of aa parameters forwarded to the test ability.
 *
 * Forwarding every parameter would leak shell arguments into the ability and
 * makes the behaviour of a run non reproducible, therefore only the documented
 * hypium filters are passed through.
 */
const PARAM_KEY_SET: Set<string> = new Set([
  '-s class', '-s notClass', '-s suite', '-s it',
  '-s level', '-s testType', '-s size', '-s timeout',
  '-s dryRun'
]);

function translateParamsToString(parameters: Record<string, string>): string {
  let targetParams: string = '';
  for (const key in parameters) {
    if (PARAM_KEY_SET.has(key)) {
      targetParams = `${targetParams} ${key} ${parameters[key]}`;
    }
  }
  return targetParams.trim();
}

/**
 * Builds the aa command used to start the test ability.
 *
 * Kept as a separate function so that the debug flag handling can be reviewed
 * without reading the shell execution code below.
 */
function buildStartCommand(bundleName: string, parameters: Record<string, string>): string {
  let cmd: string = `aa start -d 0 -a ${TEST_ABILITY} -b ${bundleName}`;
  const forwarded: string = translateParamsToString(parameters);
  if (forwarded.length > 0) {
    cmd = `${cmd} ${forwarded}`;
  }
  if (parameters['-D'] === 'true') {
    cmd = `${cmd} -D`;
  }
  return cmd;
}

async function onAbilityCreateCallback(): Promise<void> {
  logInfo('onAbilityCreateCallback');
}

async function addAbilityMonitorCallback(err: Error): Promise<void> {
  logInfo(`addAbilityMonitorCallback: ${JSON.stringify(err)}`);
}

export default class OpenHarmonyTestRunner implements TestRunner {
  constructor() {
  }

  onPrepare() {
    logInfo('OpenHarmonyTestRunner onPrepare');
  }

  async onRun() {
    logInfo('OpenHarmonyTestRunner onRun begin');
    try {
      abilityDelegatorArguments = AbilityDelegatorRegistry.getArguments();
      abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
      const bundleName: string = abilityDelegatorArguments.bundleName;
      logInfo(`bundle under test: ${bundleName}`);

      const monitor = {
        abilityName: TEST_ABILITY,
        onAbilityCreate: onAbilityCreateCallback
      };
      abilityDelegator.addAbilityMonitor(monitor, addAbilityMonitorCallback);

      const cmd: string = buildStartCommand(bundleName, abilityDelegatorArguments.parameters);
      logInfo(`start command: ${cmd}`);
      abilityDelegator.executeShellCommand(cmd, (err, data) => {
        logInfo(`executeShellCommand err: ${JSON.stringify(err)}`);
        logInfo(`executeShellCommand stdResult: ${data.stdResult}`);
        logInfo(`executeShellCommand exitCode: ${data.exitCode}`);
      });
    } catch (error) {
      logError(`onRun failed: ${JSON.stringify(error)}`);
    }
    logInfo('OpenHarmonyTestRunner onRun end');
  }
}
