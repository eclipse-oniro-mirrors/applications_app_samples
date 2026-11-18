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

import { FormField } from 'library';
import { ContactViewModel } from '../viewmodel/ContactViewModel';

const EMAIL_PATTERN: RegExp = new RegExp('^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$');
const ACTION_HEIGHT: number = 44;

@ComponentV2
export struct ContactEditPage {
  @Param vm: ContactViewModel = new ContactViewModel();
  @Event onCancel: () => void = () => {
  };
  @Event onSaved: () => void = () => {
  };

  private isCreating(): boolean {
    return this.vm.selectedContact().key.length === 0;
  }

  private titleText(): ResourceStr {
    return this.isCreating() ? $r('app.string.vc_edit_title_create') : $r('app.string.vc_edit_title_update');
  }

  private toast(message: ResourceStr): void {
    this.getUIContext().getPromptAction().showToast({ message: message, duration: 2000 });
  }

  private validate(): boolean {
    const name: string = this.vm.draft.fullName.trim();
    const email: string = this.vm.draft.email.trim();
    if (name.length === 0) {
      this.toast($r('app.string.vc_edit_name_required'));
      return false;
    }
    if (email.length > 0 && !EMAIL_PATTERN.test(email)) {
      this.toast($r('app.string.vc_edit_email_invalid'));
      return false;
    }
    this.vm.draft.fullName = name;
    this.vm.draft.email = email;
    return true;
  }

  private async handleSave(): Promise<void> {
    if (!this.validate()) {
      return;
    }
    const ok: boolean = await this.vm.save();
    if (ok) {
      this.toast($r('app.string.vc_edit_save_ok'));
      this.onSaved();
    }
  }

  @Builder
  headerBar(): void {
    Row({ space: 8 }) {
      Text(this.titleText())
        .id('id_edit_title')
        .fontSize('20fp')
        .fontWeight(FontWeight.Bold)
        .fontColor($r('app.color.text_primary'))
        .maxLines(1)
        .layoutWeight(1)

      Button($r('app.string.vc_action_cancel'))
        .id('id_edit_cancel')
        .height(32)
        .fontSize('13fp')
        .fontColor($r('app.color.text_secondary'))
        .backgroundColor($r('app.color.fill_subtle'))
        .borderRadius(16)
        .padding({ left: 12, right: 12 })
        .onClick(() => {
          this.onCancel();
        })
    }
    .width('100%')
    .alignItems(VerticalAlign.Center)
  }

  @Builder
  formFields(): void {
    Column({ space: 12 }) {
      FormField({
        idValue: 'id_edit_fullname',
        label: $r('app.string.vc_edit_full_name'),
        value: this.vm.draft.fullName,
        placeholder: $r('app.string.vc_edit_hint_full_name'),
        onValueChange: (value: string) => {
          this.vm.draft.fullName = value;
        }
      })

      FormField({
        idValue: 'id_edit_phone',
        label: $r('app.string.vc_edit_phone'),
        value: this.vm.draft.phone,
        placeholder: $r('app.string.vc_edit_hint_phone'),
        inputType: InputType.PhoneNumber,
        onValueChange: (value: string) => {
          this.vm.draft.phone = value;
        }
      })

      FormField({
        idValue: 'id_edit_email',
        label: $r('app.string.vc_edit_email'),
        value: this.vm.draft.email,
        placeholder: $r('app.string.vc_edit_hint_email'),
        inputType: InputType.Email,
        onValueChange: (value: string) => {
          this.vm.draft.email = value;
        }
      })

      FormField({
        idValue: 'id_edit_org',
        label: $r('app.string.vc_edit_org'),
        value: this.vm.draft.organization,
        placeholder: $r('app.string.vc_edit_hint_org'),
        onValueChange: (value: string) => {
          this.vm.draft.organization = value;
        }
      })

      FormField({
        idValue: 'id_edit_jobtitle',
        label: $r('app.string.vc_edit_job_title'),
        value: this.vm.draft.jobTitle,
        placeholder: $r('app.string.vc_edit_hint_job_title'),
        onValueChange: (value: string) => {
          this.vm.draft.jobTitle = value;
        }
      })

      FormField({
        idValue: 'id_edit_note',
        label: $r('app.string.vc_edit_note'),
        value: this.vm.draft.note,
        placeholder: $r('app.string.vc_edit_hint_note'),
        onValueChange: (value: string) => {
          this.vm.draft.note = value;
        }
      })
    }
    .id('id_edit_form')
    .width('100%')
    .alignItems(HorizontalAlign.Start)
  }

  @Builder
  errorBlock(): void {
    Column({ space: 4 }) {
      Text(this.vm.explainError().title)
        .id('id_edit_error_title')
        .fontSize('14fp')
        .fontWeight(FontWeight.Medium)
        .fontColor($r('app.color.danger'))
        .width('100%')
      Text(this.vm.explainError().reason)
        .id('id_edit_error')
        .fontSize('12fp')
        .fontColor($r('app.color.text_secondary'))
        .width('100%')
      Text(this.vm.explainError().suggestion)
        .id('id_edit_error_suggestion')
        .fontSize('12fp')
        .fontColor($r('app.color.text_tertiary'))
        .width('100%')
    }
    .id('id_edit_error_block')
    .width('100%')
    .padding(12)
    .backgroundColor($r('app.color.card_bg'))
    .borderRadius(12)
    .alignItems(HorizontalAlign.Start)
  }

  build() {
    Column({ space: 12 }) {
      this.headerBar()

      Scroll() {
        Column({ space: 12 }) {
          this.formFields()
          if (this.vm.errorCode !== 0) {
            this.errorBlock()
          }
        }
        .width('100%')
        .padding({ bottom: 12 })
        .alignItems(HorizontalAlign.Start)
      }
      .id('id_edit_scroll')
      .width('100%')
      .layoutWeight(1)
      .align(Alignment.TopStart)
      .scrollBar(BarState.Off)

      Button($r('app.string.vc_action_save'))
        .id('id_edit_save')
        .width('100%')
        .height(ACTION_HEIGHT)
        .fontSize('15fp')
        .fontColor($r('app.color.card_bg'))
        .backgroundColor($r('app.color.brand_primary'))
        .borderRadius(ACTION_HEIGHT / 2)
        .enabled(!this.vm.busy)
        .onClick(() => {
          this.handleSave();
        })
    }
    .id('id_edit_root')
    .width('100%')
    .height('100%')
    .padding({ left: 16, right: 16, top: 12, bottom: 16 })
    .backgroundColor($r('app.color.page_bg'))
    .alignItems(HorizontalAlign.Start)
    .justifyContent(FlexAlign.Start)
  }
}
