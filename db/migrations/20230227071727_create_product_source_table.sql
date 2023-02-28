-- migrate:up

create table product_source
(
    id          bigint auto_increment,
    created_at  datetime null,
    updated_at  datetime null,
    price       bigint not null,
    total_price bigint not null,
    status      bit null,
    state       enum('NEW', 'ACTIVE', 'DELETED'),
    product_id  bigint    not null,
    constraint product_source__pk primary key (id),
    constraint fk_product_id foreign key (product_id) references product (id)
)ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;

create table product_source_history
(
    id                bigint auto_increment,
    created_at        datetime null,
    updated_at        datetime null,
    pre_quantity      int    not null,
    current_quantity  int    not null,
    product_id        bigint not null,
    product_source_id bigint not null,
    constraint product_source_history__pk primary key (id),
    constraint fk_product_history_id foreign key (product_id) references product (id),
    constraint fk_product_source_id foreign key (product_source_id) references product_source (id)
)ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;
-- migrate:down

