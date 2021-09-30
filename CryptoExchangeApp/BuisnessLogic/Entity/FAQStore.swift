//
//  FAQStore.swift
//  CryptoExchangeApp
//
//  Created by Иван Миронов on 15.06.2021.
//

import Foundation

struct FAQStore {
    var faqArray: [Question] = [Question(question: "What happens with the remaining calls if I upgrade the plan? ", answer: "Once you upgrade plan, your used calls will be set to 0, so you can use the full allowance that you paid for."),
                                Question(question: "Is this a subscription service?", answer: "Yes. Depending on your choice, you will be billed either monthly or yearly. All subscription plans renew automatically and can be cancelled at any time."),
                                Question(question: "What date does my subscription renew?", answer: "Your subscription will renew on the same date each month. The date will be based on the date you purchased or changed your subscription. If you purchased or changed your subscription on the 29th, 30th or 31st day of the month, the renewal date is  set to 28th."),
                                Question(question: "What are the payment dates of my subscription?", answer: "Your payment date will be based on the date you purchased or changed your subscription. If you purchased or changed your subscription on the 29th, 30th or  31st day of the month, the renewal date is set to 28th."),
                                Question(question: "Can I change my payment date?", answer: "It is currently not possible to change your payment date. If you are having trouble with your existing payment date, please contact our Support Team who may be able to manually assist you with payment requests."),
                                Question(question: "What is your Refund Policy?",
                                                              answer: "We are happy to offer refunds on orders within 30 days of receiving payment and follow a fair-use policy. If you have used less than 10% of your monthly call limit, simply contact our Support Team within 30 days of payment and we will review your activity for eligibility for a full refund.")
                      ]
}
