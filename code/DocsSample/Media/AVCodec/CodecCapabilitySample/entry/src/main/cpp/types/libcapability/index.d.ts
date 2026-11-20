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
 * 获取指定类别的编解码器列表。
 *
 * @param category 编解码器类别：0-视频解码器，1-视频编码器，2-音频解码器，3-音频编码器。
 * @returns JSON数组字符串，元素包含name、mime、isHardware、isSecure、maxInstances字段。
 */
export const getCodecList: (category: number) => string;

/**
 * 获取指定名称编解码器的详细能力信息。
 *
 * @param category 编解码器类别：0-视频解码器，1-视频编码器，2-音频解码器，3-音频编码器。
 * @param name 编解码器名称。
 * @returns 多行文本，每行为一条能力描述。
 */
export const getCodecDetail: (category: number, name: string) => string;

/**
 * 执行场景化示例并返回结果文本。
 *
 * @param scenarioId 场景编号，与开发指南场景对应。
 * @returns Promise，resolve为场景执行结果描述文本。
 */
export const runScenario: (scenarioId: number) => Promise<string>;
