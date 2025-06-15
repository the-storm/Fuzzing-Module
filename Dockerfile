FROM aflplusplus/aflplusplus:v4.32c


RUN apt-get update && apt-get install -y fish build-essential gcc

RUN mkdir /seeds && cd /seeds && for i in {0..4}; do dd if=/dev/urandom of=seed_$i bs=10 count=1; done

WORKDIR /exercises

CMD ["sh", "/build_exercises.sh"]