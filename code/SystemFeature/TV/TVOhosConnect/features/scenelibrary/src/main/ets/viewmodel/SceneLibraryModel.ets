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
import { Logger, PreferencesHelper, Scene } from '@ohos/common';
import { InternationalManager } from '@ohos/mine';
import { getMock } from '../res/Mock';
import { getMockEn } from '../res/MockEn';

export class SceneLibraryModel {
  /**
   * Get detail item info.
   *
   * @return {Array<SceneBean>} sceneDataList
   */
  public async getSceneList(): Promise<Array<Scene>> {
    let language: string = await PreferencesHelper.get(InternationalManager.CURRENT_LANGUAGE_KEY, '') as string;
    let list: Scene[] = language == 'EN' ? JSON.parse(getMockEn()).scenes : JSON.parse(getMock()).scenes;
    let sceneDataList: Scene[] = [];
    list.forEach((item: Scene) => {
      sceneDataList.push(item);
    });
    return sceneDataList;
  }

  /**
   * 查询场景详情
   *
   * @return SceneBean
   */
  public async getSceneDetail(id: string): Promise<Scene> {
    let list: Scene[] = await this.getSceneList();
    let result: Scene[] = list.filter((item: Scene) => {
      return item.scenarioCard.scenarioCardId == id;
    });
    return result[0];
  }
}

let sceneLibraryModel = new SceneLibraryModel();

export default sceneLibraryModel as SceneLibraryModel;