<?php

return [

    /*
    |--------------------------------------------------------------------------
    | Office-style documents (deliverable templates, email template attachments)
    |--------------------------------------------------------------------------
    */
    'office' => [
        'mimes' => 'pdf,doc,docx,xls,xlsx,ppt,pptx',
        'max_kb' => 5120,
        'accept' => '.pdf,.doc,.docx,.xls,.xlsx,.ppt,.pptx,application/pdf,application/msword,application/vnd.openxmlformats-officedocument.wordprocessingml.document,application/vnd.ms-excel,application/vnd.openxmlformats-officedocument.spreadsheetml.sheet,application/vnd.ms-powerpoint,application/vnd.openxmlformats-officedocument.presentationml.presentation',
        'help' => 'Allowed: PDF (.pdf), Word (.doc, .docx), Excel (.xls, .xlsx), PowerPoint (.ppt, .pptx). Maximum size: 5 MB.',
    ],

    /*
    |--------------------------------------------------------------------------
    | Legal entity document vault
    |--------------------------------------------------------------------------
    */
    'entity_vault' => [
        'mimes' => 'pdf,doc,docx,xls,xlsx,png,jpg,jpeg',
        'max_kb' => 10240,
        'accept' => '.pdf,.doc,.docx,.xls,.xlsx,.png,.jpg,.jpeg,image/png,image/jpeg,application/pdf,application/msword,application/vnd.openxmlformats-officedocument.wordprocessingml.document,application/vnd.ms-excel,application/vnd.openxmlformats-officedocument.spreadsheetml.sheet',
        'help' => 'Allowed: PDF, Word, Excel, PNG, JPG, JPEG. Maximum size: 10 MB.',
    ],
];
