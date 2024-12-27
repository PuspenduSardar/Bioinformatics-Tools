# fastq_stats.py
import sys

def calculate_quality(qualities):
    return sum(ord(char) - 33 for char in qualities) / len(qualities)

def fastq_stats(fastq_file):
    with open(fastq_file, 'r') as f:
        read_count = 0
        total_length = 0
        total_quality = 0
        
        while True:
            try:
                header = next(f).strip()
                sequence = next(f).strip()
                plus = next(f).strip()
                quality = next(f).strip()
                
                read_count += 1
                total_length += len(sequence)
                total_quality += calculate_quality(quality)
            except StopIteration:
                break
                
        avg_read_length = total_length / read_count if read_count > 0 else 0
        avg_quality = total_quality / read_count if read_count > 0 else 0
        
        print(f"Total Reads: {read_count}")
        print(f"Average Read Length: {avg_read_length}")
        print(f"Average Quality Score: {avg_quality:.2f}")

if __name__ == "__main__":
    fastq_file = sys.argv[1]
    fastq_stats(fastq_file)
