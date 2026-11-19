/*
 * Copyright (c) 2022-2023 Huawei Device Co., Ltd.
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

import { abilityDelegatorRegistry } from '@kit.TestKit'
import type { TestRunner } from '@kit.TestKit'
import { BusinessError } from '@kit.BasicServicesKit'
import { logger } from '../util/Logger'

const TAG: string = 'OpenHarmonyTestRunner'
const TEST_ABILITY: string = 'TestAbility'
const UNLOCK_ERROR: number = -3
/** Hypium 过滤参数，需要从 aa test 透传给 TestAbility，否则批量执行时会退化为全量运行 */
const PASS_THROUGH_PARAMS: string[] = ['class', 'suite', 'it', 'level', 'size', 'timeout']

async function onAbilityCreateCallback(): Promise<void> {
  logger.info(TAG, 'onAbilityCreateCallback')
}

async function addAbilityMonitorCallback(err: BusinessError): Promise<void> {
  logger.info(TAG, `addAbilityMonitorCallback : ${JSON.stringify(err) ?? ''} `)
}

export default class OpenHarmonyTestRunner implements TestRunner {
  constructor() {
  }

  onPrepare(): void {
    logger.info(TAG, 'OpenHarmonyTestRunner OnPrepare ')
  }

  async onRun(): Promise<void> {
    logger.info(TAG, 'OpenHarmonyTestRunner onRun run')
    const delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
    const delegatorArgs: abilityDelegatorRegistry.AbilityDelegatorArgs = abilityDelegatorRegistry.getArguments()
    const monitor: abilityDelegatorRegistry.AbilityMonitor = {
      abilityName: TEST_ABILITY,
      moduleName: this.getModuleName(delegatorArgs),
      onAbilityCreate: onAbilityCreateCallback
    }
    try {
      await delegator.addAbilityMonitor(monitor, addAbilityMonitorCallback)
    } catch (err) {
      const error = err as BusinessError
      logger.error(TAG, `addAbilityMonitor failed, code: ${error.code}, message: ${error.message}`)
    }
    const cmd: string = this.buildStartCommand(delegatorArgs)
    logger.info(TAG, `cmd : ${cmd}`)
    delegator.executeShellCommand(cmd).then((result: abilityDelegatorRegistry.ShellCmdResult) => {
      logger.info(TAG, `executeShellCommand : stdResult: ${result.stdResult}, exitCode: ${result.exitCode}`)
      if (result.stdResult.includes('error: unlock screen failed in developer mode') ||
        result.stdResult.includes('10106102')) {
        delegator.finishTest('', UNLOCK_ERROR, () => {
        })
      }
    }).catch((err: BusinessError) => {
      logger.error(TAG, `executeShellCommand failed, code: ${err.code}, message: ${err.message}`)
    })
    logger.info(TAG, 'OpenHarmonyTestRunner onRun end')
  }

  private getModuleName(delegatorArgs: abilityDelegatorRegistry.AbilityDelegatorArgs): string {
    const parameters: Record<string, string> = delegatorArgs.parameters
    const moduleName: string | undefined = parameters['-m']
    return moduleName !== undefined ? moduleName : ''
  }

  private buildStartCommand(delegatorArgs: abilityDelegatorRegistry.AbilityDelegatorArgs): string {
    let cmd: string = `aa start -d 0 -a ${TEST_ABILITY} -b ${delegatorArgs.bundleName}`
    const parameters: Record<string, string> = delegatorArgs.parameters
    if (parameters['-D'] === 'true') {
      cmd += ' -D'
    }
    for (const key of PASS_THROUGH_PARAMS) {
      const prefixed: string | undefined = parameters['-s ' + key]
      const value: string | undefined = prefixed !== undefined ? prefixed : parameters[key]
      if (value !== undefined && value !== '') {
        cmd += ` -s ${key} ${value}`
      }
    }
    const breakpoint: string | undefined = parameters['breakpoint-list']
    if (breakpoint !== undefined && breakpoint !== '') {
      cmd += ` -s breakpoint-list ${breakpoint}`
    }
    return cmd
  }
}
