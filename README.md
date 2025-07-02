# 🐳 Kafka Stack com Docker Compose

Este repositório fornece um ambiente de desenvolvimento local completo com **Kafka**, **Schema Registry** e **Control Center** usando Docker Compose. Ideal para testes, desenvolvimento de aplicações que consomem Kafka e experimentos com Avro.

## 📦 Serviços

### 1. `broker` - Apache Kafka (Bitnami)
- **Imagem:** `bitnami/kafka:3.9.0`
- **Portas Expostas:**
  - `9092`: Acesso externo (localhost)
  - `29092`: Acesso interno entre containers
  - `9093`: Comunicação com controller
  - `9101`: JMX para monitoramento
- **Características:**
  - Configurado como broker e controller em um único nó
  - Healthcheck via `nc` (netcat) na porta 9092
  - Integração com Schema Registry e Control Center

### 2. `schema-registry` - Confluent Schema Registry
- **Imagem:** `confluentinc/cp-schema-registry:7.4.0`
- **Porta:** `8081`
- **Função:** Fornece suporte para schemas Avro, utilizado pelo Kafka para validação de mensagens
- **Configurações:**
  - Conectado ao Kafka via `broker:29092`
  - Healthcheck via `curl` no endpoint raiz

### 3. `control-center` - Confluent Control Center
- **Imagem:** `confluentinc/cp-enterprise-control-center:7.4.0`
- **Porta:** `9021`
- **Função:** Dashboard web para gerenciamento e monitoramento do Kafka, tópicos, consumidores e schemas
- **Configurações:**
  - Conectado ao Kafka e ao Schema Registry
  - Healthcheck no endpoint `/health`

## 🔗 Network

Todos os containers estão na mesma rede `privatenet`, o que permite comunicação interna por hostname.

## ▶️ Como usar

1. Clone o repositório:
   ```bash
   git clone https://github.com/acnaweb/kafka
   cd kafka
   ```

2. Inicie os serviços:
   ```bash
   docker compose up -d
   ```

3. Acesse os serviços:
   - Kafka (externo): `localhost:9092`
   - Schema Registry: [http://localhost:8081](http://localhost:8081)
   - Control Center: [http://localhost:9021](http://localhost:9021)

4. Verifique logs (opcional):
   ```bash
   docker compose logs -f broker
   docker compose logs -f schema-registry
   docker compose logs -f control-center
   ```

## 🧪 Teste Rápido com Kafka CLI

Para testar tópicos localmente com o Kafka CLI:

```sh
docker exec -it broker bash
```
####  Criar um tópico

```sh
kafka-topics.sh --bootstrap-server broker:29092     --create  --topic test-topic \
--partitions 1 \
--replication-factor 1
```

#### Listar tópicos

```sh
kafka-topics.sh --bootstrap-server broker:29092 --list
```

#### Produzir mensagens (produtor)

```sh
kafka-console-producer.sh --broker-list broker:29092 --topic test-topic
```
#### Consumir mensagens (consumidor)

```sh
kafka-console-consumer.sh --bootstrap-server broker:29092 \
  --topic test-topic \
  --from-beginning
```

## 🧹 Encerrar e limpar

Para parar e remover todos os containers:

```bash
docker compose down
```

---

## ⚠️ Observações

- Este ambiente **não deve ser usado em produção**
- O uso da porta `29092` é interno entre containers; para conexão via host local, use `9092`
- A licença do Control Center Enterprise é gratuita para desenvolvimento

---

## 📚 Recursos úteis

- [Kafka Quickstart](https://kafka.apache.org/quickstart)
- [Schema Registry](https://docs.confluent.io/platform/current/schema-registry/index.html)
- [Control Center](https://docs.confluent.io/platform/current/control-center/index.html)