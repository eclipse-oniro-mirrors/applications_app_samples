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

import { common } from '@kit.AbilityKit';
import { contact } from '@kit.ContactsKit';
import { ContactDraft, ContactSummary } from '../model/ContactTypes';
import { Formatter } from '../common/Formatter';

export class ContactService {
  static async loadContacts(context: common.Context): Promise<ContactSummary[]> {
    const source: contact.Contact[] = await contact.queryContacts(context);
    const summaries: ContactSummary[] = [];
    for (const item of source) {
      summaries.push(ContactService.toSummary(item));
    }
    summaries.sort(ContactService.compare);
    return summaries;
  }

  static async createContact(context: common.Context, draft: ContactDraft): Promise<number> {
    const data: contact.Contact = new contact.Contact();
    ContactService.fillContact(data, draft, [draft.phone], [draft.email]);
    return contact.addContact(context, data);
  }

  static async updateContact(context: common.Context, summary: ContactSummary, draft: ContactDraft): Promise<void> {
    const phones: string[] = ContactService.mergePrimary(summary.phones, draft.phone);
    const emails: string[] = ContactService.mergePrimary(summary.emails, draft.email);
    const data: contact.Contact = { id: summary.id, key: summary.key };
    ContactService.fillContact(data, draft, phones, emails);
    await contact.updateContact(context, data);
  }

  static async removeContact(context: common.Context, key: string): Promise<void> {
    await contact.deleteContact(context, key);
  }

  private static toSummary(item: contact.Contact): ContactSummary {
    const summary: ContactSummary = new ContactSummary();
    summary.id = item.id !== undefined ? item.id : -1;
    summary.key = item.key !== undefined ? item.key : '';
    summary.fullName = item.name !== undefined ? item.name.fullName : '';
    summary.initial = Formatter.initial(summary.fullName);
    if (item.phoneNumbers !== undefined) {
      for (const phone of item.phoneNumbers) {
        ContactService.pushValue(summary.phones, phone.phoneNumber);
      }
    }
    if (item.emails !== undefined) {
      for (const email of item.emails) {
        ContactService.pushValue(summary.emails, email.email);
      }
    }
    if (item.postalAddresses !== undefined) {
      for (const address of item.postalAddresses) {
        ContactService.pushValue(summary.addresses, ContactService.formatAddress(address));
      }
    }
    if (item.websites !== undefined) {
      for (const site of item.websites) {
        ContactService.pushValue(summary.websites, site.website);
      }
    }
    if (item.organization !== undefined) {
      summary.organization = item.organization.name;
      summary.jobTitle = item.organization.title !== undefined ? item.organization.title : '';
    }
    if (item.note !== undefined) {
      summary.note = item.note.noteContent;
    }
    return summary;
  }

  private static formatAddress(address: contact.PostalAddress): string {
    const parts: string[] = [];
    ContactService.pushPart(parts, address.region);
    ContactService.pushPart(parts, address.city);
    ContactService.pushPart(parts, address.street);
    ContactService.pushPart(parts, address.postcode);
    ContactService.pushPart(parts, address.country);
    return parts.join(' ');
  }

  private static pushPart(parts: string[], value: string | undefined): void {
    if (value !== undefined) {
      ContactService.pushValue(parts, value);
    }
  }

  private static pushValue(target: string[], value: string): void {
    const trimmed: string = value.trim();
    if (trimmed.length > 0) {
      target.push(trimmed);
    }
  }

  private static mergePrimary(current: string[], next: string): string[] {
    const merged: string[] = [];
    const primary: string = next.trim();
    if (primary.length > 0) {
      merged.push(primary);
    }
    const oldPrimary: string = current.length > 0 ? current[0] : '';
    for (const value of current) {
      if (value !== oldPrimary) {
        merged.push(value);
      }
    }
    return merged;
  }

  private static fillContact(data: contact.Contact, draft: ContactDraft, phones: string[],
    emails: string[]): void {
    data.name = { fullName: draft.fullName.trim() };
    const phoneItems: contact.PhoneNumber[] = [];
    for (const phone of phones) {
      const value: string = phone.trim();
      if (value.length > 0) {
        phoneItems.push({ phoneNumber: value });
      }
    }
    data.phoneNumbers = phoneItems;
    const emailItems: contact.Email[] = [];
    for (const email of emails) {
      const value: string = email.trim();
      if (value.length > 0) {
        emailItems.push({ email: value });
      }
    }
    data.emails = emailItems;
    const organization: string = draft.organization.trim();
    if (organization.length > 0) {
      const organizationValue: contact.Organization = { name: organization };
      const jobTitle: string = draft.jobTitle.trim();
      if (jobTitle.length > 0) {
        organizationValue.title = jobTitle;
      }
      data.organization = organizationValue;
    }
    const note: string = draft.note.trim();
    if (note.length > 0) {
      data.note = { noteContent: note };
    }
  }

  private static compare(left: ContactSummary, right: ContactSummary): number {
    if (left.initial !== right.initial) {
      if (left.initial === '#') {
        return 1;
      }
      if (right.initial === '#') {
        return -1;
      }
      return left.initial < right.initial ? -1 : 1;
    }
    return left.fullName.localeCompare(right.fullName);
  }
}
