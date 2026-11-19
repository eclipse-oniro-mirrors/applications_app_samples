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

import { AbilityConstant, ConfigurationConstant, UIAbility, Want } from '@kit.AbilityKit';
import { window } from '@kit.ArkUI';
import { BusinessError } from '@kit.BasicServicesKit';
import Logger from '../util/Logger';

/**
 * Provides the home page that publishes and observes the custom common event.
 */
export default class EntryAbility extends UIAbility {
    onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
        try {
            this.context.getApplicationContext().setColorMode(ConfigurationConstant.ColorMode.COLOR_MODE_NOT_SET);
        } catch (error) {
            Logger.error(`Failed to set the color mode: ${(error as BusinessError).message}`);
        }
        Logger.enter('EntryAbility');
    }

    onDestroy(): void {
        Logger.leave('EntryAbility');
    }

    onWindowStageCreate(windowStage: window.WindowStage): void {
        Logger.event('EntryAbility', 'onWindowStageCreate');
        windowStage.loadContent('pages/Index', (error: BusinessError) => {
            if (error.code) {
                Logger.error(`Failed to load the content: ${JSON.stringify(error)}`);
                return;
            }
            Logger.info('Succeeded in loading the content.');
        });
    }

    onWindowStageDestroy(): void {
        Logger.event('EntryAbility', 'onWindowStageDestroy');
    }

    onForeground(): void {
        Logger.show('EntryAbility');
    }

    onBackground(): void {
        Logger.hide('EntryAbility');
    }
}