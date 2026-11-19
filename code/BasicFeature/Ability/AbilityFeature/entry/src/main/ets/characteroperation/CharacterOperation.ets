/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

import { common, ConfigurationConstant } from '@kit.AbilityKit';
import { UIContext } from '@kit.ArkUI';
import { BusinessError } from '@kit.BasicServicesKit';
import { LANGUAGE_EN_US, LANGUAGE_ZH_CN, SAMPLE_FILE_NAME, TOAST_DURATION } from '../common/AppConstants';
import {
  countExisting,
  createStorageFiles,
  listStoragePaths,
  STORAGE_AREAS,
  StorageOperationResult,
  StoragePathRecord
} from '../model/StoragePath';
import { logger } from '../util/Logger';

const TAG: string = 'CharacterOperation';

/**
 * 把“定制应用环境参数”“清理应用数据”两类能力封装在一起。
 *
 * 页面负责取 UIContext 并传入，测试侧可以只传 Context（不传 UIContext）：
 * 此时所有 Toast 都不展示，但返回值、文件副作用照常发生，便于断言。
 */
export default class CharacterOperation {
  private context: common.UIAbilityContext;
  private uiContext: UIContext | undefined;

  constructor(context: common.UIAbilityContext, uiContext?: UIContext) {
    this.context = context;
    this.uiContext = uiContext;
  }

  // 设置中文
  setZHCNLanguage(): void {
    this.context.getApplicationContext().setLanguage(LANGUAGE_ZH_CN);
    logger.info(`${TAG} set language ${LANGUAGE_ZH_CN}`);
  }

  // 设置英文
  setENUSLanguage(): void {
    this.context.getApplicationContext().setLanguage(LANGUAGE_EN_US);
    logger.info(`${TAG} set language ${LANGUAGE_EN_US}`);
  }

  // 设置深色模式
  setDarkColorMode(): void {
    this.context.getApplicationContext().setColorMode(ConfigurationConstant.ColorMode.COLOR_MODE_DARK);
    this.showToast($r('app.string.switchDarkSuccess'));
  }

  // 设置浅色模式
  setLightColorMode(): void {
    this.context.getApplicationContext().setColorMode(ConfigurationConstant.ColorMode.COLOR_MODE_LIGHT);
    this.showToast($r('app.string.switchLightSuccess'));
  }

  // 返回 5 个沙箱目录下的占位文件路径
  generateStorageFiles(fileName: string = SAMPLE_FILE_NAME): string[] {
    return listStoragePaths(this.context, fileName).map((record: StoragePathRecord) => record.filePath);
  }

  // 创建存储数据
  createStorageData(fileName: string = SAMPLE_FILE_NAME): StorageOperationResult {
    const result: StorageOperationResult = createStorageFiles(this.context, fileName);
    if (result.success) {
      this.showToast($r('app.string.create_File_Success'));
    }
    logger.info(`${TAG} createStorageData created=${result.createdCount}, missing=${result.missing.join(',')}`);
    return result;
  }

  // 检查文件：5 个目录都存在才算成功
  checkStorageData(fileName: string = SAMPLE_FILE_NAME): boolean {
    const existing: number = countExisting(this.context, fileName);
    const allExist: boolean = existing === STORAGE_AREAS.length;
    if (allExist) {
      this.showToast($r('app.string.search_File_Success'));
    } else {
      this.showToast($r('app.string.search_File_Failed'));
    }
    logger.info(`${TAG} checkStorageData existing=${existing}, allExist=${allExist}`);
    return allExist;
  }

  /**
   * 清理自身数据。5 个目录都存在时才真正调用 clearUpApplicationData —— 该接口会结束进程，
   * 因此自动化用例只覆盖“文件不全 → 不清理”这条分支，真正清理由手工用例验证。
   */
  clearStorageData(fileName: string = SAMPLE_FILE_NAME): boolean {
    const existing: number = countExisting(this.context, fileName);
    if (existing !== STORAGE_AREAS.length) {
      this.showToast($r('app.string.clean_Data_Failed'));
      logger.info(`${TAG} clearStorageData skipped, existing=${existing}`);
      return false;
    }
    this.context.getApplicationContext().clearUpApplicationData((err: BusinessError) => {
      logger.info(`${TAG} clearUpApplicationData err: ${JSON.stringify(err)}`);
      this.showToast($r('app.string.clean_Data_Success'));
    });
    return true;
  }

  private showToast(message: Resource): void {
    if (this.uiContext === undefined) {
      return;
    }
    this.uiContext.getPromptAction().showToast({ message: message, duration: TOAST_DURATION });
  }
}
