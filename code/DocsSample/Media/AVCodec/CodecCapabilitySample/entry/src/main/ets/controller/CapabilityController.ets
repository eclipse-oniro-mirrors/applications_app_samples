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

import { getCodecList, getCodecDetail, runScenario } from 'libcapability.so';
import { CodecBrief } from '../model/CodecModel';
import Logger from '../common/utils/Logger';

const TAG: string = '[CapabilityController]';

/**
 * 编解码能力查询控制器，封装native接口调用。
 */
export class CapabilityController {
  /**
   * 获取指定类别的编解码器列表。
   *
   * @param category 编解码器类别。
   * @returns 编解码器概要信息列表。
   */
  static getCodecList(category: number): CodecBrief[] {
    try {
      const json: string = getCodecList(category);
      const list: CodecBrief[] = JSON.parse(json) as CodecBrief[];
      return list;
    } catch (err) {
      Logger.error(TAG, 'getCodecList failed, %{public}s', JSON.stringify(err));
      return [];
    }
  }

  /**
   * 获取指定名称编解码器的详细能力信息。
   *
   * @param category 编解码器类别。
   * @param name 编解码器名称。
   * @returns 详细能力描述文本。
   */
  static getCodecDetail(category: number, name: string): string {
    try {
      return getCodecDetail(category, name);
    } catch (err) {
      Logger.error(TAG, 'getCodecDetail failed, %{public}s', JSON.stringify(err));
      return '查询编解码器详情失败。';
    }
  }

  /**
   * 执行场景化示例。
   *
   * @param scenarioId 场景编号。
   * @returns Promise，resolve为场景执行结果文本。
   */
  static runScenario(scenarioId: number): Promise<string> {
    return runScenario(scenarioId);
  }
}
