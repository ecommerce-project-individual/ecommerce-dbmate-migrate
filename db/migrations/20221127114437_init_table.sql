-- migrate:up
create table role
(
    id         int auto_increment,
    created_at datetime     null,
    updated_at datetime     null,
    name       varchar(255) null,
    constraint role__pk primary key (id)
)ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;

create table user
(
    id         bigint auto_increment,
    created_at datetime     null,
    updated_at datetime     null,
    address    varchar(255) null,
    birthday   date         null,
    email      varchar(255) null,
    full_name  varchar(255) null,
    password   varchar(255) null,
    phone      varchar(255) null,
    status     varchar(255) null,
    role_id    int       not null,
    constraint user__pk primary key (id),
    constraint fk_role_id foreign key (role_id) references role (id)
)ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;

create table category
(
    id             int auto_increment,
    created_at     datetime     null,
    updated_at     datetime     null,
    name           varchar(255) null,
    position       int          null,
    product_detail varchar(255) null,
    status         bit          null,
    constraint category__pk primary key (id)

)ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;

create table product
(
    id          bigint auto_increment,
    created_at  datetime     null,
    updated_at  datetime     null,
    description text         null,
    detail      varchar(255) null,
    image       varchar(255) null,
    image_list  varchar(255) null,
    name        varchar(255) null,
    price       bigint       null,
    quantity    int          null,
    status      bit          null,
    view        int          null,
    category_id int       not null,
    constraint product__pk primary key (id),
    constraint fk_category_id foreign key (category_id) references category (id)

)ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;

create table discount
(
    id         bigint auto_increment,
    created_at datetime     null,
    updated_at datetime     null,
    discount   int          null,
    end_date   datetime     null,
    name       varchar(255) null,
    start_date datetime     null,
    product_id bigint       null,
    constraint discount__pk primary key (id),
    constraint fk_product_discount_id foreign key (product_id) references product (id)
)ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;

create table product_order
(
    id             bigint auto_increment,
    created_at     datetime null,
    updated_at     datetime null,
    amount         double   null,
    quantity       int      null,
    discount_id    bigint   null,
    product_id     bigint   null,
    transaction_id bigint   null,
    constraint product_order__pk primary key (id),
    constraint fk_product_order_id foreign key (product_id) references product (id),
    constraint fk_discount_id foreign key (discount_id) references discount (id)

)ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;

create table product_rating
(
    id          bigint auto_increment,
    created_at  datetime     null,
    updated_at  datetime     null,
    content     varchar(255) null,
    number_star int          null,
    product_id  bigint       not null,
    user_id     bigint       not null,
    constraint product_rating__pk primary key (id),
    constraint fk_user_rating_id foreign key (user_id) references user (id),
    constraint fk_product_rating_id foreign key (product_id) references product (id)

)ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;

create table slider
(
    id         bigint auto_increment,
    created_at datetime     null,
    updated_at datetime     null,
    link       varchar(255) null,
    name       varchar(255) null,
    status     bit          null,
    constraint slider__pk primary key (id)
)ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;

create table transaction
(
    id           bigint auto_increment,
    created_at   datetime     null,
    updated_at   datetime     null,
    address      varchar(255) null,
    amount       double       null,
    message      varchar(255) null,
    payment      varchar(255) null,
    payment_info varchar(255) null,
    security     varchar(255) null,
    status       varchar(255) null,
    user_email   varchar(255) null,
    user_phone   varchar(255) null,
    user_id      bigint       null,
    constraint transaction__pk primary key (id),
    constraint fk_user_transaction_id foreign key (user_id) references user (id)

)ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;

-- migrate:down

