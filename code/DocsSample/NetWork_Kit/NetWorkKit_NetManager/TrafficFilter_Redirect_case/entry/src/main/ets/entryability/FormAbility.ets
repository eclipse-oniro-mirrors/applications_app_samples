/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2023. All rights reserved.
 */

import { formInfo } from '@kit.FormKit'
import { formBindingData } from '@kit.FormKit';
import { Want } from '@kit.AbilityKit';
import { PushExtensionAbility } from '@kit.PushKit';
import { hilog } from '@kit.PerformanceAnalysisKit';

export default class FormAbility extends PushExtensionAbility {
  onAddForm(want: Want): formBindingData.FormBindingData {
    const formId = want.parameters![formInfo.FormParam.IDENTITY_KEY] as string;
    hilog.info(0x0000, 'PushKitDemo', 'Get formId successfully: %{public}s', JSON.stringify(formId));

    const bindingData = formBindingData.createFormBindingData({
      formId,
      text: 'default',
      image: '',
    });

    bindingData.proxies = [
      {
        key: 'text', subscriberId: formId
      },
      {
        key: 'image', subscriberId: formId
      },
    ];
    return bindingData;
  }

  onCastToNormalForm(formId: string) {
  }

  onUpdateForm(formId: string) {
  }

  onChangeFormVisibility(newStatus: Record<string, number>) {
  }

  onFormEvent(formId: string, message: string) {
  }

  onRemoveForm(formId: string) {
  }

  onAcquireFormState(want: Want) {
    return formInfo.FormState.READY;
  }

};
