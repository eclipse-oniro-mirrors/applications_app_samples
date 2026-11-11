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

import { AbilityConstant, UIAbility, Want } from '@kit.AbilityKit';
import { window } from '@kit.ArkUI';

/** Test-only allowlist; no distributed permission or production scene routing. */
export default class FeatureQaAbility extends UIAbility {
  private scenario: string = 'empty';
  private allowed: boolean = false;
  private stage: window.WindowStage | undefined = undefined;

  public onCreate(want: Want, _launchParam: AbilityConstant.LaunchParam): void {
    this.selectPage(want);
  }

  public onNewWant(want: Want, _launchParam: AbilityConstant.LaunchParam): void {
    this.selectPage(want);
    const stage = this.stage;
    if (stage !== undefined) {
      this.loadPage(stage);
    }
  }

  private selectPage(want: Want): void {
    const parameters = want.parameters;
    this.allowed = parameters !== undefined && parameters['testPage'] === 'WorkspaceBackupUiQa';
    const scenario = parameters === undefined ? undefined : parameters['qaScenario'];
    this.scenario = typeof scenario === 'string' ? scenario : 'empty';
  }

  public onWindowStageCreate(stage: window.WindowStage): void {
    this.stage = stage;
    this.loadPage(stage);
  }

  public onWindowStageDestroy(): void {
    this.stage = undefined;
  }

  private loadPage(stage: window.WindowStage): void {
    if (!this.allowed) {
      console.error('FeatureQaAbility requires allowlisted testPage=WorkspaceBackupUiQa');
      return;
    }
    const storage = new LocalStorage();
    storage.setOrCreate('qaScenario', this.scenario);
    stage.loadContent('testpages/WorkspaceBackupUiQaHarness', storage, (error): void => {
      if (error.code) {
        console.error(`Workspace QA page load failed: ${error.code} ${error.message}`);
      }
    });
  }
}
