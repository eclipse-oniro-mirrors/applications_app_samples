/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { CommonButton } from '../util/CommonButton';
import resource from '../util/resource';

@Entry
@Component
struct Index {
  aboutToAppear() {
  }

  build() {
    Scroll() {
      Flex({ direction: FlexDirection.Row, wrap: FlexWrap.Wrap }) {
        Text(resource.resourceToString($r('app.string.Worker_introduction').id))
          .padding('15vp')
          .width('100%')
          .fontSize('25fp')
          .textAlign(TextAlign.Center)
        CommonButton({
          buttonName: resource.resourceToString($r('app.string.stageRules').id),
          buttonUrl: 'managers/stageRules'
        });
        CommonButton({
          buttonName: resource.resourceToString($r('app.string.Basic_usage').id),
          buttonUrl: 'managers/Index'
        });
        CommonButton({
          buttonName: resource.resourceToString($r('app.string.Cross_har').id),
          buttonUrl: 'managers/crosshar'
        });
        CommonButton({
          buttonName: resource.resourceToString($r('app.string.Recommend').id),
          buttonUrl: 'managers/recommend'
        });
        CommonButton({
          buttonName: resource.resourceToString($r('app.string.Not_recommended_one').id),
          buttonUrl: 'managers/notrecommendedone'
        });
        CommonButton({
          buttonName: resource.resourceToString($r('app.string.Not_recommended_two').id),
          buttonUrl: 'managers/notrecommendedtwo'
        });
        CommonButton({
          buttonName: resource.resourceToString($r('app.string.fileNotice').id),
          buttonUrl: 'managers/CreateWorker'
        });
        CommonButton({
          buttonName: resource.resourceToString($r('app.string.stageRules1').id),
          buttonUrl: 'managers/StageRulesFa'
        });
        CommonButton({
          buttonName: resource.resourceToString($r('app.string.stageRules2').id),
          buttonUrl: 'managers/StageRulesHar'
        });
        CommonButton({
          buttonName: resource.resourceToString($r('app.string.stageRules3').id),
          buttonUrl: 'managers/StageRulesThreadFile'
        });
      }
      .padding('20vp')
      .width('100%')
    }.margin({ bottom: 60 })
    .width('100%')
  }
}
